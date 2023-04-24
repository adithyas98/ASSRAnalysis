clear all
close all
pack
clc

addpath('C:\Users\ams2590\Documents\MATLAB\eeglab2021.1')
addpath('C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts');
addpath('H:\TMS ASSR Analysis\Scripts');
scripts = 'H:\TMS ASSR Analysis\Scripts';
addpath('C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts\functions');
eeglab

pathname_source = 'H:\TMS ASSR Analysis\processed_data';

% Subject Properties

subjs = dir([pathname_source '\BEPOCH.Average_REF\']);
subjectfolderflag = [subjs.isdir];%We want to know if the item is a directory
subjs = {subjs(subjectfolderflag).name};
subjs = subjs(3:end);%we want to cut out the first two file names which are '.' and '..'
trial_type = '40-500ms'; %80, 05, 12, 40-500ms

%  TF Analysis + Average Re-Referenced ERPs

for s=1:length(subjs)
    for assesmentType={'PRE','POST','POST1'} 
        subject = [ subjs{s}(5:6) '-' subjs{s}(8:11)];
        
        pathname_read     = [pathname_source '\BEPOCH.Average_REF\' subjs{s}];
        pathname_write    = [pathname_source '\ERPs.Average_REF'];

        
        % if folder doesn't exist then make it
        if exist(pathname_write, 'dir')==0
            mkdir(pathname_write);
        end

        
        nbin = 4;
        
%       sname = sprintf('ASSR-%s-%s-BEPOCH.average-ref', subject,assesmentType{1}); % subject's filename
        sname = sprintf('ASSR-%s-BEPOCH.average-ref', subject); % subject's filename

        fname = fullfile(pathname_read, [sname '.set']); % now including whole path and extension .vhdr
        
        if exist(fname, 'file')>0
            
            % load file and convert it into EEG structure
            EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);
            
            % Average ERPs
            ERP = pop_averager( EEG , 'Criterion', 'good', 'ExcludeBoundary', 'on', 'SEM', 'on' ); %change if need shorter ERP averages
            
            if nbin~=ERP.nbin
                error('Script:DifferentNumberOfBins','ERP from %s does not have %g bins, it has %g!\n', sname, nbin, ERP.nbin);
            end
            if ERP.nchan ~=64
                disp(ERP.nchan)
                disp(sname)
            end
            % Save ERP
            erpname = sprintf('ASSR_%s_%s_Average_REF_ERP', subject, trial_type);

            %erpname = sprintf('ASSR_%s_%s_%s_Average_REF_ERP', subject, trial_type,assesmentType{1});
            ERP  = pop_savemyerp(ERP, 'erpname', erpname, 'filename', [erpname '.erp'], 'filepath', pathname_write);
            
            % write number of trials accepted for each bin to file
            
            headers = {'record_id'
                ['b1_' trial_type 'Hz_Standard_acc_epochs']
                ['b1_' trial_type 'Hz_Standard_perct_acc']
                'b2_Target_Beeps_acc_epochs'
                'b2_Target_Beeps_perct_acc'
                'b3_Correct_Mouse_Clicks_acc_epochs'
                'b3_Correct_Mouse_Clicks_perct_acc'
                'b4_Incorrect_Mouse_Clicks_acc_epochs'
                'b4_Incorrect_Mouse_Clicks_perct_acc'};
            
            trial_perc_accepted = zeros(1,4)
            
            for n=1:4
                trial_perc_accepted(n) = (ERP.ntrials.accepted(n)/(ERP.ntrials.accepted(n)+ERP.ntrials.rejected(n))*100)
            end
            trial_acc = {ERP.ntrials.accepted};
            
            subject_name = subjs{s}
            data = zeros(2,9)
            for n=2:2:9
                data(2,n) = ERP.ntrials.accepted(n/2)
            end
            for n=3:2:9
                data(2,n) = trial_perc_accepted((n-1)/2)
            end
            format shortG
            
            data = num2cell(data)
            
            for c=1:9
                data{1,c} = headers{c}
            end
            
            data{2,1} = subject_name;
            if exist([pathname_source '\Epoch_for_ERP_Accepted_Rates\80Hz'], 'dir')==0
                mkdir([pathname_source '\Epoch_for_ERP_Accepted_Rates\80Hz']);
            end            
            cd([pathname_source '\Epoch_for_ERP_Accepted_Rates\80Hz'])
            filename_stats = ['Summary_Epoch_stats_' subjs{s} '_' assesmentType{1} '_' trial_type 'Hz_' date  '.xlsx'];
            xlswrite(filename_stats,data)
            
            
            %%%%Common Properties for all 3 types of TFA
            omegas = {3,5,6};  % # of cycles. 3 is good for lower frequency, 6 is better for higher
            
            for o=1:length(omegas)
                omega = omegas{o};
                %Create a folder for this
                pathname_writetfa = strcat(pathname_source,'\ALL_TFA');
                if exist(pathname_writetfa, 'dir')==0
                    mkdir(pathname_writetfa);
                end
                binArray = 1:ERP.nbin; %all bins (6 for ASSR)
                nElecs = 1:ERP.nchan; % for all
                baseline_correction_window = [-500 0]; % in ms
                frequency_range = [0.5 50]; % was [0.5 50] before
                
                %%%%%%%%%%%%No Base line Total Power
                baseline_correction_type = 'none'; % type of baseline correction
                TFA = TimeFrequencyAverager(EEG, ERP, binArray, nElecs, frequency_range, omega, baseline_correction_window, baseline_correction_type, 0); % change as needed
                % Save TFA
                %tfasetname = sprintf('ASSR_%s_%s_%s_Average_REF_TFA_No_BL_TPower_%scycle', subject, trial_type,assesmentType{1},string(omega));
                tfasetname = sprintf('ASSR_%s_%s_Average_REF_TFA_No_BL_TPower_%scycle', subject, trial_type,string(omega));

                filenameTFA = fullfile(pathname_writetfa, [tfasetname '.tfa']); % now including whole path and extension .vhdr
                TFA.setname  = tfasetname;
                save(filenameTFA, 'TFA');
                
                %%%%%%%%%%%ITC, No baseline
                baseline_correction_type = 'none'; %no baselining available for ITC
                TFA = TimeFrequencyAverager(EEG, ERP, binArray, nElecs, frequency_range, omega, baseline_correction_window, baseline_correction_type, 3);
                % Save TFA
                %tfasetname = sprintf('ASSR_%s_%s_%s_Average_REF_TFA_ITC_%scycle', subject, trial_type,assesmentType{1},string(omega));
                tfasetname = sprintf('ASSR_%s_%s_Average_REF_TFA_ITC_%scycle', subject, trial_type,string(omega));

                filenameTFA = fullfile(pathname_writetfa, [tfasetname '.tfa']); % now including whole path and extension .vhdr
                TFA.setname  = tfasetname;
                save(filenameTFA, 'TFA');
                clear TFA
                
                %%%%%%%%%%% TFA Evoked Power
                baseline_correction_type = 'none';
                fprintf('AVINOT: CALCULATING EVOKED POWER\n')
                TFA = GetEvokedTimeFrequency(ERP, binArray, nElecs, frequency_range, omega, baseline_correction_window, baseline_correction_type, 1); %1 at end means include phase
                % Save TFA
                %tfasetname = sprintf('ASSR_%s_%s_%s_Average_REF_TFA_EPower_%scycle', subject, trial_type,assesmentType{1},string(omega));
                tfasetname = sprintf('ASSR_%s_%s_Average_REF_TFA_EPower_%scycle', subject, trial_type,string(omega));

                filenameTFA = fullfile(pathname_writetfa, [tfasetname '.tfa']); % now including whole path and extension .vhdr
                TFA.setname  = tfasetname;
                save(filenameTFA, 'TFA');
                clear TFA
                
                %%%%%%%%  Baseline correction
                baseline_correction_type = 'subtractive';
                TFA = TimeFrequencyAverager(EEG, ERP, binArray, nElecs, frequency_range, omega, baseline_correction_window, baseline_correction_type, 0);
                %tfasetname = sprintf('ASSR_%s_%s_%s_Average_REF_TFA_%s_BL_TPower_%scycle', subject, trial_type,assesmentType{1},string(baseline_correction_window(1)),string(omega));
                tfasetname = sprintf('ASSR_%s_%s_Average_REF_TFA_%s_BL_TPower_%scycle', subject, trial_type,string(baseline_correction_window(1)),string(omega));

                filenameTFA = fullfile(pathname_writetfa, [tfasetname '.tfa']); % now including whole path and extension .vhdr
                TFA.setname  = tfasetname;
                save(filenameTFA, 'TFA');
                clear TFA
                
            end
         
            clear ERP EEG TFA
            clc
        else
            fprintf('\n *** WARNING: %s does not exist *** \n\n', fname);
        end
    end
end
disp('done')
%% Examine Individual TFA plots

filename = sprintf('%s_%s_%s_TFA.tfa', subject, phase, task);
filepath = [pathname_source phase '\' tasks{a} '\TFA'];

TFA = loadTFA('filename',filename,'filepath',filepath); %load TFA file to plot

datatype = 0; % 0=power; 1=phase; 2=amplitude; 3=ITC (you can specify more than one value)
binArray = [1]; % Bin indices to plot
chanArray = [5]; % Maximum number of channels = TFA.nchan
amprange = [0 .5]; % Amplitude range (Z-scale) (displayed as colormap) to plot.
twindow = [-100 500 -100:100:500]; % Time window where the first two numbers are the min and max and then remaining numbers designate the ticks
fwindow = [0 70    1 3 5  10 12 13 15 18 20 25 30 35 40 45 50 60 70 80 100 ]; % Time frequency window structured similarly to the twindow
blcwin = [-100 0]; % Baseline correction window
blctype = 'subtractive'; % 'Divisive' or 'none' are the other types
fshading = 'interp'; % Controls of color shading. Can be 'flat' or  'interp'.
fcontour = 'off'; % displays isolines calculated from matrix Z and fills the areas between the isolines using constant colors corresponding to the current figure's colormap. Can be 'on' or  'off'.
Ylog = 0; % Logarithmic scale for frequency range (fwindow). Can be 1 (means apply log scale)  or  0 (means apply linear scale).
plotype = 1; % Plotting style: 0 means topographic; 1 means rectangular array. IMPORTANT: if you enter chanArray as a cell array then this 'plotype' option will be ignored.
% clrbar =0; % 0 = colorbar off, 1 = on
% fontsize = 16;
% fontname = 'Arial';
% % x_axis_width = .6;
% % y_axis_height = .8;
% electrode_title = 0;

plotTFA(TFA, datatype, binArray, chanArray, amprange, twindow, fwindow, blcwin, blctype,fshading,fcontour,Ylog,plotype);