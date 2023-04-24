% Author: Abe & Pejman
% Nathan Kline Institute
% Orangeburg, NY 10962
% 2018
%edited for AVL, directories changed for Ellee's comp

clear all
close all
pack
clc

% Add filepaths
addpath('C:\Users\debaunh\Documents\MATLAB\Columbia_scripts')
addpath('C:\Users\debaunh\Documents\MATLAB\eeglab13_4_4b');
addpath('C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\functions');
eeglab

pathname_source = 'F:\ECR_Reading_EEG_data\processed_data\' % .eeg files location

%% Subject Properties

study = 'ECR'; % 'EC', 'LA', 'DSER', 'AVL', 'CVN', 'NKI'
%site = '101';
%phase = 'P3';
group = '08'; % MAKE SURE THIS MATCHES group_name - 00=HC, 04=CHR, 08=SZ
group_name = 'SZ'; % MAKE SURE THIS MATCHES group - 00=HC, 04=CHR, 08=SZ
long_group_name = 'Patients'; % MAKE SURE THIS MATCHES group - 00=Controls, 08=Patients
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
%% Run ICA for multiple tasks from a single participant

a=1
subjs = importlist(['F:\ECR_Reading_EEG_data\subject_lists\' tasks{a} '\' study '_' tasks{a} '_' group_name '_subjs.txt']); % import subject list

for s=1:length(subjs)
    for p=1:length(ASSR_trial)

    pathname_read  = [pathname_source '\' group_name '\' tasks{a} '\PREPRO_MERGED_CRAPOUT\' study '-' group '-' subjs{s}];
    pathname_write = [pathname_source '\' group_name '\' tasks{a} '\ICA\' study '-' group '-' subjs{s}]; % Bad Electrodes removed path

    % if folder doesn't exist then make it
    if exist(pathname_write, 'dir')==0
        mkdir(pathname_write);
    end

    sname = sprintf('%s_%s_%s_%s_%s_ALLMERGED_crapout', study, group, subjs{s}, tasks{a}, ASSR_trial{p});
    fname = fullfile(pathname_read, [sname '.set']); % now including whole path and extension .vhdr

    if exist(char(fname), 'file')>0

        % load file and convert it into EEG structure
        fprintf('Processing Subject %s\n', [sname '.set'])
        EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);

        % Remove noisy channels from ICA calculations
        badchanindx = str2num(EEG.condition);
        badchanindx = unique([badchanindx]); % this changes if you made a bipolar VEOG chan in previous step
        chan4ICA = 1:EEG.nbchan;
        chan4ICA = chan4ICA(~ismember(chan4ICA,badchanindx )); % only good chans go to ICA (chan4ICA-badchans)

        % Run ICA
        EEG = pop_runica(EEG, 'icatype','runica','dataset',1,'options',{'extended' 1},'chanind', chan4ICA );

        % Save dataset
        EEG.setname = sprintf('%s_%s_%s_%s_%s_ICA', study, group, subjs{s}, tasks{a}, ASSR_trial{p}); % subject's filename
        EEG = pop_saveset( EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write); % For 
        clear EEG
    else
        fprintf('\n *** WARNING: %s does not exist *** \n\n', fname);
    end
    end
end

