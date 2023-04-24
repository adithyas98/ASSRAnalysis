% Author: Abe & Pejman, 2018
%edited 2020 - directories changed for Ellee's computer for TMPAPI
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



subjs = dir([pathname_source '\PREPRO_CRAPOUT\']);
subjectfolderflag = [subjs.isdir];%We want to know if the item is a directory
subjs = {subjs(subjectfolderflag).name};
subjs = subjs(3:end);%we want to cut out the first two file names which are '.' and '..'

trial_type = '40-500ms'; %80, 05, 12, 40-500ms
% Run ICA
bad_components = {};
for s=1:length(subjs)
    for assesmentType={'PRE','POST','POST1'}
        subject = [subjs{s}(5:6) '-' subjs{s}(8:11)];

        pathname_read  = [pathname_source '\PREPRO_CRAPOUT\' subjs{s}];
        pathname_write = [pathname_source '\ICA\' subjs{s}];

        % if folder doesn't exist then make bit
        if exist(pathname_write, 'dir')==0
            mkdir(pathname_write);
        end

        %sname = sprintf('ASSR-%s-%s-%s-PREPRO-crapout', subject, trial_type,assesmentType{1});
        sname = sprintf('ASSR-%s-%s-PREPRO-crapout', subject, trial_type);
        fname = fullfile(pathname_read, [sname '.set']); % now including whole path and extension .vhdr

        if exist(char(fname), 'file')>0

            % load file and convert it into EEG structure
            fprintf('Processing Subject %s\n', [sname '.set'])
            EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);

            chan4ICA = 1:EEG.nbchan;

            % Run ICA, Dan said we didn't need to do this for ASSR
            %EEG = pop_runica(EEG, 'icatype','runica','dataset',1,'options',{'extended' 1},'chanind', chan4ICA );

            % Save dataset
            %EEG.setname = sprintf('ASSR-%s-%s-%s-ICA', subject, trial_type,assesmentType{1});
            EEG.setname = sprintf('ASSR-%s-%s-ICA', subject, trial_type);

            EEG = pop_saveset( EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write); % For 
            disp('Saving the file ...');
            pathname_write_ICA_pruned = [pathname_source '\ICA_Pruned\' subjs{s}];
            if exist(pathname_write_ICA_pruned, 'dir')==0
                mkdir(pathname_write_ICA_pruned);
            end            

            %mark and remove ICA components - muscle threshold 95%, eye 90%
            %EEG = pop_iclabel(EEG, 'default');
            %EEG = eeg_checkset( EEG );
            %[ EEG, com ] = pop_icflag(EEG, [NaN NaN;0.95 1;0.9 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]); %muscle threshold 95%, eye 90%
            %linearIndices = find(EEG.reject.gcompreject==1); 
            %%%%%%%%%%%%%%%%%%%The lines that we have to do have two %%
            %%EEG = eeg_checkset( EEG );
            %EEG = pop_subcomp( EEG, [linearIndices], 0);
            %%EEG = pop_subcomp( EEG, [28], 0);%We actually want to keep the first component
            %save pruned ICA dataset
            %EEG.setname= sprintf('ASSR-%s-%s-%s-ICA_pruned', subject, trial_type,assesmentType{1});

            EEG.setname= sprintf('ASSR-%s-%s-ICA_pruned', subject, trial_type);
            EEG = pop_saveset(EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write_ICA_pruned);

            %bad_components{s} = linearIndices';

        else
            fprintf('\n *** WARNING: %s does not exist *** \n\n', fname);
        end
    end
end
disp('ICA Done')
