
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

subjs = dir([pathname_source '\Average_REF\']);
subjectfolderflag = [subjs.isdir];%We want to know if the item is a directory
subjs = {subjs(subjectfolderflag).name};
subjs = subjs(3:end);%we want to cut out the first two file names which are '.' and '..'
    %ECR_08_0015 (new), ECR_00_0008(old)
trial_type = '40-500ms'; %80, 05, 12, 40-500ms

%
fileID = fopen([pathname_source '\Summary_ARTDET_BEPOCH_ALLSUBJ.txt'],'w');
badFiles = {};
for s=1:length(subjs)
    for assesmentType={'PRE','POST','POST1'}
        subject = [ subjs{s}(5:6) '-' subjs{s}(8:11)];
        
        fprintf(fileID,'Subject\t\tRemoved_Compo\n');
        
        ASSR_BDFile = [scripts '\ASSR_' trial_type '_bins.txt'];
        %ASSR_BDFile = 'C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts\bins\ASSR_09_Feb_21.txt';
        
        pathname_read = [pathname_source '\Average_REF\' subjs{s}];
        pathname_write = [pathname_source '\BEPOCH.Average_REF\' subjs{s}];
        
        if exist(pathname_write, 'dir')==0
            mkdir(pathname_write);
        end
        
        %sname = sprintf('ASSR-%s-%s-INTP-Average-REF', subject,assesmentType{1});
        sname = sprintf('ASSR-%s-INTP-Average-REF', subject);
                
        fname = fullfile(pathname_read, [sname '.set']);
        
        if exist(fname, 'file')>0
            
            % load file and convert it into EEG structure
            fprintf('Processing Subject %s\n', [sname '.set'])
            EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);
            
            % Create EVENTLIST
            
            EEG = pop_creabasiceventlist( EEG , 'AlphanumericCleaning', 'on', 'BoundaryNumeric', { -99 }, 'BoundaryString', { 'boundary' } );
            EEG = pop_binlister( EEG, 'BDF', ASSR_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG','Warning','Off' );

            

            
            EEG = pop_epochbin( EEG , [-1000 2000],  [-300 0]); %-1000 to 1000 epoch with -500 to 0 baseline
            
            threshold = 120;
            
            try
                EEG  = pop_artmwppth( EEG , 'Channel',  1:EEG.nbchan, 'Flag',  1, 'Threshold',  threshold, 'Twindow', [ -100 400], 'Windowsize',  200, 'Windowstep',  100 );
            catch
                continue;
                badfiles{end+1} = sname;
            end           
            
            %excluded Fp1 and Fp2 to increase accepted epochs
            
            %EEG.setname = sprintf('ASSR-%s-%s-BEPOCH.average-ref', subject,assesmentType{1}); % subject's filename
            EEG.setname = sprintf('ASSR-%s-BEPOCH.average-ref', subject); % subject's filename

            EEG = pop_saveset( EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write);
            if EEG.nbchan ~= 64
                disp("Doesn't have 64 Channels")
                disp(sname)
            end
            [~, MPD] = getardetection(EEG, 1);
            [~, ~, acce, rej] = pop_summary_AR_eeg_detection(EEG, '');
            
            fprintf(fileID,'%s\t\t%.1f\n', sname, MPD);
            
            clear EEG
        else
            fprintf('\n *** WARNING: %s does not exist *** \n\n', fname);
        end
    end
end
fclose(fileID);
disp('done')       
          
          