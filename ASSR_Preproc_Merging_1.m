%for tmpapi - 2020

clear all %#ok<CLALL>
close all
pack
clc


addpath('C:\Users\ams2590\Documents\MATLAB\eeglab2021.1')
addpath('C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts');
addpath('H:\TMS ASSR Analysis\Scripts')
addpath('C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts\functions');
eeglab

pathname_source = 'H:\TMS ASSR Analysis\TMS Data';
pathname_destination = 'H:\TMS ASSR Analysis\processed_data'; % Subdirectory for exporting EEG files after conversion for EEGLab
if exist(pathname_destination, 'dir')==0
    mkdir(pathname_destination);
end
pathchanlocs = 'C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts\Standard Brainvision 64 channel cap.elp'; % Electrode Location File (for topographies)


subjs = dir(pathname_source);
subjectfolderflag = [subjs.isdir];%We want to know if the item is a directory
subjs = {subjs(subjectfolderflag).name};
subjs = subjs(3:end);%we want to cut out the first two file names which are '.' and '..'

new_system = 1; %set to 1 if used new system

trial_type = '40-500ms'; %80, 05, 12

% Processing Parameters

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
    

%
badChanSummaryPath = [pathname_destination '\Bad_Channels_Summary\'];
if exist(badChanSummaryPath, 'dir')==0
    mkdir(badChanSummaryPath);
end
cd(badChanSummaryPath)
badFiles = {};
for s=1:length(subjs)
        
        subject = [subjs{s}(5:6) '-' subjs{s}(8:11)];
        disp(subject);
        pathname_write = [pathname_destination '\PREPRO\ECR-' subject];
        % if folder doesn't exist then make it
        if exist(pathname_write, 'dir')==0
            mkdir(pathname_write);
        end
            
        filepathname = [pathname_source '\' subjs{s}];
        for assesmentType={'PRE','POST','POST1'}
            if strcmp(trial_type,'40-500ms')
                trials = 5;
                load('C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts\EEGtemplate.mat')
                ALLEEG = [EEG, EEG, EEG, EEG, EEG]; % for task modularity, edit this to be an empty 1-by-max_blocks struct with all EEG field names
            else
                trials = 1;
            end
            for trial = 1:trials
                if strcmp(trial_type,'40-500ms')
                    if new_system == 1
                        %filename = ['ECR-ACH-' subject '-' assesmentType{1} '-ASSR40-500ms-' num2str(trial) '.vhdr'];
                        filename = ['ECR-ACH-' subject '-ASSR40-500ms-' num2str(trial) '.vhdr'];
                    else
                        filename = ['ECR-' subject '-ASSR40-500ms-' num2str(trial) '.vhdr'];
                    end
                else
                        filename = ['ECR-ACH-' subject '-' assesmentType{1} '-ASSR' num2str(trial_type) '.vhdr'];
                end
                        
        fileID = fopen(['Summary_BadChan_ASSR_' date '_' subject '_0' num2str(trial) '_' trial_type '.txt'],'w'); %initialize txt file & headers for badchan report:
        fprintf(fileID,'Subject\tBadChannels\tNumBadChannels\tBadExternalChan\n');
       
            % Load EEG
            try
                EEG = pop_loadbv(filepathname, filename);
                disp('Read File')
            catch
                badFiles{end+1} = filename;
                continue;
            end

            % Check EEG file Properties
            EEG = eeg_checkset( EEG );

            % Apply Channel Map (used for topographies later)
            if new_system == 1                
                EEG = pop_chanedit(EEG, 'insert',64,'changefield',{64,'labels','PO8'},'changefield',{64,'theta','144.142'},'changefield',{64,'radius','0.52231'},'changefield',{64,'X','-68.7209'},'changefield',{64,'Y','-49.6689'},'changefield',{64,'Z','-5.953'},'changefield',{64,'sph_theta','-144.142'},'changefield',{64,'sph_phi','-4.016'},'changefield',{64,'sph_radius','85'});
                EEG = eeg_checkset( EEG ); 
                EEG = pop_reref( EEG, [1:63] ,'refloc',struct('labels',{'PO8'},'sph_radius',{85},'sph_theta',{-144.142},'sph_phi',{-4.016},'theta',{144.142},'radius',{0.52231},'X',{-68.7209},'Y',{-49.6689},'Z',{-5.953},'type',{''},'ref',{''},'urchan',{[]},'datachan',{0}),'keepref','on'); %re-references to average calculated from 63 channels (not including PO8), but you can also change it to whatever re-ref you want (could do mastoids). This step also adds back in PO8.
                EEG = pop_chanedit(EEG, 'load',{pathchanlocs,'filetype','besa'});
            else
                EEG  = pop_chanedit(EEG, 'load',{pathchanlocs 'filetype' 'autodetect'});
            end
            
            % Remove leading and trailing data from the continuous EEG
            %EEG  = pop_eegtrim( EEG, 1000, 1000 , 'post',  1000, 'pre',  1000 );

            % Rename triggers
            EEG = ASSR_triggers(EEG);
           
            % Delete any time segments where there are 3 seconds without 
            % triggers. Data is preserved for the 1 second after the last 
            % trigger before the triggerless time segment up to 1 second before
            % the trigger that follows the triggerless time segment.
%             EEG = erplabDeleteLongTimeSegments(EEG, 3000, 1000, 1000, []);

            % High pass filter 0.1 Hz
            EEG  = pop_basicfilter( EEG,  1:EEG.nbchan , 'Boundary', 'boundary', 'Cutoff', highPassFreq, 'Design', 'butter', 'Filter', 'highpass', 'Order',  highPassOrder, 'RemoveDC', 'on' );

            % Low pass filter 80 Hz
            EEG  = pop_basicfilter( EEG,  1:EEG.nbchan , 'Boundary', 'boundary', 'Cutoff', lowPassFreq, 'Design', 'butter', 'Filter', 'lowpass', 'Order',  lowPassOrder, 'RemoveDC',...
                'on' ); 

            % Notch Filter at 60 Hz (for electrical noise)
            EEG  = pop_basicfilter( EEG,  1:EEG.nbchan , 'Boundary', 'boundary', 'Cutoff', 60, 'Design', 'notch', 'Filter', 'PMnotch', 'Order',  180);

             if strcmp(trial_type,'40-500ms')
                [ALLEEG EEG] = eeg_store(ALLEEG, EEG, trial);
                 clear EEG
                 disp(filename)
             end
            end
        
        try
             if strcmp(trial_type,'40-500ms')
                EEG = pop_mergeset(ALLEEG, 1:5, 0);
             end
        catch 
            %Most likely that the data doesn't actually exist
            continue;  
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
        fprintf(fileID,'%s-0%s\t%s\t%g\t%s\n', subject, trial, chanstring, length(badchanindx), exChanString);

        % Save dataset
        Tname = sprintf('ASSR-%s-%s-PREPRO-merged', subject, trial_type); % subject's filename
        %Tname = sprintf('ASSR-%s-%s-%s-PREPRO-merged', subject, trial_type,assesmentType{1}); % subject's filename
        EEG.setname = Tname;
        EEG = pop_saveset( EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write);
        
        clear EEG
        clear ALLEEG
        clear filename
        clear filepath
    
    fclose(fileID);
    end
end
disp('done');