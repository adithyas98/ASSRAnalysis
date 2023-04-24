% Authors: Abe & Pejman
% Nathan Kline Institute
% Orangeburg, NY 10962
% 2018
%edited Sept 2019 - directories changed for Ellee's computer, specifically for EC data
%edited Sept 2019 by Blair: standardized processing changes for MMN per Dan/Pejman/Mike, added subject list/loop and options for different data sources

clear all %#ok<CLALL>
close all
pack
clc

addpath('C:\Users\debaunh\Documents\MATLAB\eeglab13_4_4b');
addpath('C:\Users\debaunh\Documents\MATLAB\Columbia_scripts')
addpath('C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\functions');
addpath('C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\trigger_scripts');
eeglab

pathname_destination = 'F:\ECR_Reading_EEG_data\processed_data\'; % Subdirectory for exporting EEG files after conversion for EEGLab
pathchanlocs = 'C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\Standard Brainvision 64 channel cap.elp'; % Electrode Location File (for topographies)

%% Subject Properties

study = 'ECR'; % 'EC', 'LA', 'DSER', 'AVL', 'CVN', 'NKI'
%site = '101';
%phase = 'P3';
group = '00'; % MAKE SURE THIS MATCHES group_name - 00=HC, 04=CHR, 08=SZ
group_name = 'HC'; % MAKE SURE THIS MATCHES group - 00=HC, 04=CHR, 08=SZ
long_group_name = 'Controls'; % MAKE SURE THIS MATCHES group - 00=Controls, 08=Patients
ASSR_trial = {
    '05'
    '12'
    '40-500ms'
    '40-1300ms'
    '80'
    }
%ASSR_max_blocks = 5; % number of blocks recorded for CreepE_Time1


tasks = {
    'ASSR'
%     'P50'
%    'P300'
%     'QEEG'
%     'GammaAOD'
    };
%% Processing Parameters

%External Channel Index: put in indices corresponding to external channels
externalChan = [1 2];

%filter variables
lowPassFreq = 80; %in Hz
lowPassOrder = 4; 
highPassFreq = 0.1; %in Hz
highPassOrder = 2;

%bad channel detection variables, setting threshold values in microvolts 200 19 1 0
peak2peak = 200;
sixtyHz = 19;
flatline = 1;
badChanThresh = 16; % percent of trace needed for bad channel

%bad external channel detection
peak2peakEx = 500; %not using this criteria right now
sixtyHzEx = 50; %not using this criteria right now
flatlineEx = 2; % INCREASED THIS FROM 1 TO 2 B/C WASN'T CATCHING DEAD FP1/FP2 CHANNELS (MANUALLY FLAGGED CHAN IN EEG.condition FOR ONE PARTICIPANT; RE-RAN ANOTHER WITH NEW CRITERION)
badExChanThresh = 50;


%% Import EEG data for all tasks

% .eeg files location:
pathname_source = ['F:\ECR_Reading_EEG_data\RAW_DATA\'];


for b=1:length(tasks)
 % Determine number of blocks for merging (only 1 block for AdaptiveP3
    % and QEEG, so no merging for those tasks)
    if strcmp(tasks(b), 'AUD')
        max_blocks = AUD_max_blocks;
        if strcmp(study, 'AVL') || strcmp(study, 'DSER')
            group = 'BL'; % reassigns from group code to timepoint to avoid confusion of Lieber subject IDs with pCodes; D-serine timepoint is actually P1, but called BL because MMN is collected before dosing
        elseif strcmp(study, 'NKI')
            group = group_name;
        end
    elseif strcmp(tasks(b), 'P50')
        max_blocks = P50_max_blocks;
    else
        max_blocks = 1;
    end
    
    subjs = importlist(['F:\ECR_Reading_EEG_data\subject_lists\' tasks{b} '\' study '_' tasks{b} '_' group_name '_subjs.txt']); % import subject list
    %subjs = {'10'}; % use for testing only - COMMENT OUT
    
    % initialize txt file & headers for badchan report:
    cd(['F:\ECR_Reading_EEG_data\processed_data\' group_name '\Bad_Channels\'])
    fileID = fopen(['Summary_BadChan_' tasks{b} '_' study '_' group_name '_' date '.txt'],'w');
    fprintf(fileID,'Subject\tBadChannels\tNumBadChannels\tBadExternalChan\n');
%%
    for s=1:length(subjs)
        for p=1:length(ASSR_trial)

        pathname_write = [pathname_destination group_name '\' tasks{b} '\PREPRO_MERGED\' study '-' group '-' subjs{s}];

        % if folder doesn't exist then make it
        if exist(pathname_write, 'dir')==0
            mkdir(pathname_write);
        end

       

        %ALLEEG = cell(1); % This variable is only utilized for tasks with more than 1 block   
        %%
        load('EEGtemplate.mat')
        ALLEEG = [EEG, EEG, EEG, EEG, EEG, EEG, EEG]; % for task modularity, edit this to be an empty 1-by-max_blocks struct with all EEG field names
        for a=1:max_blocks


            % Determine filename before importing
    %         if strcmp(tasks(b), 'P300')
    %             filename = ['AdaptiveP3_' subjs{s} '.vhdr'];
    %         elseif strcmp(tasks(b), 'MMN')
    %             filename = [study '-' site phase '-' subjs{s} '-MMN-0' num2str(a) '.vhdr'];
    %         elseif strcmp(tasks(b), 'QEEG')
    %             filename = ['QEEG_' subjs{s} '.vhdr'];
    %         end
    
            switch study
                case 'ECR'
                    filename = [study '-' group '-' subjs{s} '-' tasks{b} ASSR_trial{p} '.vhdr'];
                    filepathname = [pathname_source group_name '\' study '_' group '_' subjs{s} '\' tasks{b}];

                case 'LA'
                    filename = [study '-' group '-' subjs{s} '-' tasks{b} '-0' num2str(a) '.vhdr'];
                    filepathname = [pathname_source group '-' subjs{s} '\' tasks{b}];
                    if exist(filepathname, 'dir')==0 % if a path to AUD doesn't exist in EC/LA, it's because AUD was recorded during a 2nd session...
                        filepathname = [pathname_source group '-' subjs{s} '-2\' tasks{b}]; % reassigns data source path to 2nd session
                    end
                case 'AVL'
                    filename = [study '-' subjs{s} '-BL-' tasks{b} '-0' num2str(a) '.vhdr'];
                    filepathname = [pathname_source study '-' subjs{s} '\' study '-' subjs{s} '-BL\' tasks{b}];
                    if exist(filepathname, 'dir')==0 % if a path to AUD doesn't exist in AVL, it's because different techs used different folder-naming conventions, and it was easier to fix this way than renaming them
                        filepathname = [pathname_source study '-' subjs{s} '\BL\' tasks{b}]; % reassigns data source path 
                    end
                case 'DSER'
                    filename = [study '-101P1-' subjs{s} '-MMN-0' num2str(a) '.vhdr'];
                    filepathname = [pathname_source study '-101P1-' subjs{s}  '\MMN_' tasks{b}];
                    %filepathname = [pathname_source study '-101P1-' subjs{s}  '\MMN-' tasks{b}]; % 1005 only
                case 'NKI'
                    filename = ['EC_' subjs{s} '_CreepE_0' num2str(a) '.vhdr'];
                    filepathname = [pathname_source '\' long_group_name '\' subjs{s}];
                otherwise
                    disp('*******Please add filename/filepath for this study!!!************')
            end
            

            % Load EEG
            EEG = pop_loadbv(filepathname, filename);
            %EEG.setname = [study '-' group '-' subjs{s} '-' char(tasks(b)) '-0' num2str(a)];

            % Check EEG file Properties
            EEG = eeg_checkset( EEG );

            % Apply Channel Map (used for topographies later)
            EEG  = pop_chanedit(EEG, 'load',{pathchanlocs 'filetype' 'autodetect'});

            % Remove leading and trailing data from the continuous EEG
            EEG  = pop_eegtrim( EEG, 1000, 1000 , 'post',  1000, 'pre',  1000 );

            % Rename triggers
            if strcmp(tasks(b), 'P300')
                EEG = BV_AdaptiveP3_triggers(EEG);
            elseif strcmp(tasks(b), 'ASSR')
                EEG = ASSR_triggers(EEG);
            elseif strcmp(tasks(b), 'AUD')
                EEG = CreepE_triggers(EEG);
            elseif strcmp(tasks(b), 'QEEG')
                EEG = QEEG_triggers(EEG);
            elseif strcmp(tasks(b), 'P50')
                EEG = P50_triggers(EEG);
            elseif strcmp(tasks(b), 'GammaAOD')
                EEG = GammaAOD_triggers(EEG);
            end

            % Delete any time segments where there are 3 seconds without 
            % triggers. Data is preserved for the 1 second after the last 
            % trigger before the triggerless time segment up to 1 second before
            % the trigger that follows the triggerless time segment.
            EEG = erplabDeleteLongTimeSegments(EEG, 3000, 1000, 1000, []);

            % High pass filter 0.1 Hz
            EEG  = pop_basicfilter( EEG,  1:EEG.nbchan , 'Boundary', 'boundary', 'Cutoff', highPassFreq, 'Design', 'butter', 'Filter', 'highpass', 'Order',  highPassOrder, 'RemoveDC', 'on' );

            % Low pass filter 80 Hz
            EEG  = pop_basicfilter( EEG,  1:EEG.nbchan , 'Boundary', 'boundary', 'Cutoff', lowPassFreq, 'Design', 'butter', 'Filter', 'lowpass', 'Order',  lowPassOrder, 'RemoveDC',...
                'on' ); % CHANGE BACK TO 80 IF TFA WORKS WITH 80->50Hz

            % Notch Filter at 60 Hz (for electrical noise)
            EEG  = pop_basicfilter( EEG,  1:EEG.nbchan , 'Boundary', 'boundary', 'Cutoff', 60, 'Design', 'notch', 'Filter', 'PMnotch', 'Order',  180);

            % If there are multiple blocks to combine, add them to the 'ALLEEG'
            % variable
            if strcmp(tasks(b), 'AUD')||strcmp(tasks(b), 'P50')
                %ALLEEG(a)={EEG};
                ALLEEG(a)=EEG;
                clear EEG
            end
        end

        % Merge ALLEEG variable if there was more than one block (only applies
        % to MMN and P50)
        if strcmp(tasks(b), 'AUD')||strcmp(tasks(b), 'P50')
            EEG = pop_mergeset(ALLEEG, 1:max_blocks, 0);
        end

        % detect bad channels
        badchan     = detectBadChannels(EEG, [1 1 1 0],[peak2peak sixtyHz flatline 0], badChanThresh); %peak2peak, 
        badchanindx = find(badchan);
        %don't include exteral EOG channels as bad channels (ch 1 & 2)
        badchanindx = badchanindx(~ismember(badchanindx, externalChan));     
        EEG.condition = vect2colon(badchanindx); %create string for bad channel numbers (not including bad external chans)
        chanstring = num2str(badchanindx); %create string for bad channel numbers
        % detect bad external channels (only using flatline criterion now...)
        badExChan = detectBadChannels(EEG, [0 0 1 0], [peak2peakEx sixtyHzEx flatlineEx 0], badExChanThresh);
        badExChanIndx = find(badExChan);
        badExChanIndx = badExChanIndx(ismember(badExChanIndx, externalChan));
        lbexch = length(badExChanIndx);
        if lbexch == 0
            exChanString = 'no bad external channels';
        else
            exChanString = num2str(badExChanIndx);
        end
        
        % print bad chan report to txt file
        fprintf(fileID,'%s-%s-%s\t%s\t%g\t%s\n', study, group, subjs{s}, chanstring, length(badchanindx), exChanString);

        % Save dataset
        Tname = sprintf('%s_%s_%s_%s_%s_ALLMERGED', study, group, subjs{s}, tasks{b}, ASSR_trial{p}); % subject's filename
        EEG.setname = Tname;
        EEG = pop_saveset( EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write);
        clear EEG
    
        end
    end
    fclose(fileID);
end
