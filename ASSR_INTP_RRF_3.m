clear all
close all
pack
clc

addpath('C:\Users\ams2590\Documents\MATLAB\eeglab2021.1')
addpath('C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts');
addpath('H:\TMS ASSR Analysis\Scripts')
addpath('C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts\functions');
eeglab
pathname_source = 'H:\TMS ASSR Analysis\processed_data';

% Subject Properties
subjs = dir([pathname_source '\ICA\']);
subjectfolderflag = [subjs.isdir];%We want to know if the item is a directory
subjs = {subjs(subjectfolderflag).name};
subjs = subjs(3:end);%we want to cut out the first two file names which are '.' and '..'
    %ECR_08_0015 (new), ECR_00_0008(old)
trial_type = '40-500ms'; %80, 05, 12, 40-500ms
%

for s=1:length(subjs)
    for assesmentType={'PRE','POST','POST1'}
        subject = [subjs{s}(5:6) '-' subjs{s}(8:11)];
        
        pathname_read  = [pathname_source '\ICA_pruned\' subjs{s}];
        pathname_write = [pathname_source '\Average_REF\' subjs{s}];
        
        if exist(pathname_write, 'dir')==0
            mkdir(pathname_write);
        end
        
        %sname = sprintf('ASSR-%s-%s-%s-ICA_pruned', subject, trial_type,assesmentType{1});
        sname = sprintf('ASSR-%s-%s-ICA_pruned', subject, trial_type);

        fname = fullfile(pathname_read, [sname '.set']);
        
        if exist(fname, 'file')>0
            
            % load file and convert it into EEG structure
            fprintf('Processing Subject %s\n', [sname '.set'])
            EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);
            
            %re-reference to average of all channels, exclude none
            EEG = pop_reref( EEG, {'TP9' 'TP10'},'keepref','on' ); % (EEG, refchan# []=all, 'exclude', [chan#s to exclude from ref])  % change chan#s if using diff system
            if EEG.nbchan ~= 64
                disp(sname)
            end
            % Get stored bad channels indices
            badchanstr = EEG.condition;
            if ~isempty(badchanstr)
                badchanindx = str2num(badchanstr);
                if ~isempty(badchanindx)
                    % Interpolation
                    EEG = pop_interp(EEG, badchanindx, 'spherical');
                end
            end
            
            badchannels{s} = badchanstr;
            
            
            % Save dataset
            %EEG.setname = sprintf('ASSR-%s-%s-INTP-Average-REF', subject,assesmentType{1}); % subject's filename
            EEG.setname = sprintf('ASSR-%s-INTP-Average-REF', subject); % subject's filename

            EEG = pop_saveset( EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write);
            clear EEG
        else
            fprintf('\n *** WARNING: %s does not exist *** \n\n', fname);
        end
    end 
end
disp("Done")