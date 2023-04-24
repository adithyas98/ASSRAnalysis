% Author: Abe & Pejman
% Nathan Kline Institute
% Orangeburg, NY 10962
% 2018
%edited - for AVL, directories changed for Ellee's computer

clear
close all
pack
clc

% Paths
addpath('C:\Users\debaunh\Documents\MATLAB\eeglab13_4_4b');
addpath('C:\Users\debaunh\Documents\MATLAB\Columbia_scripts')
addpath('C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\functions');
addpath('C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\trigger_scripts');
eeglab

pathname_source = 'F:\ECR_Reading_EEG_data\processed_data\';
%% Subject and Recording Properties

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
%% Automatic Interpolation and Average Rereference

a=1
subjs = importlist(['F:\ECR_Reading_EEG_data\subject_lists\' tasks{a} '\' study '_' tasks{a} '_' group_name '_subjs.txt']); % import subject list

for s = 1:length(subjs)
    for p = 1:length(ASSR_trial)
    % Specify Re-referencing Type 
    ref_type = 2; % (1=average, 2=mastoid)
    
    if ref_type==1
        ref_type_name = 'Average_REF';
        reref_input = [];
    elseif ref_type==2
        ref_type_name = 'Mastoid_REF';
        reref_input = [17, 22];
    end
    

    pathname_read  = [pathname_source '\' group_name '\' tasks{a} '\ICA\' study '-' group '-' subjs{s}];
    pathname_write = [pathname_source '\' group_name '\' tasks{a} '\' ref_type_name '\' study '-' group '-' subjs{s}];

    % if folder doesn't exist then make it
    if exist(pathname_write, 'dir')==0
        mkdir(pathname_write);
    end

    sname = sprintf('%s_%s_%s_%s_%s_ICA_pruned', study, group, subjs{s}, tasks{a}, ASSR_trial{p}); % subject's filename after manual ICA component removal
    fname = fullfile(pathname_read, [sname '.set']); 

    if exist(fname, 'file')>0

        % load file and convert it into EEG structure
        EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);

        % Get stored bad channels indices
        badchanstr = EEG.condition;
        if ~isempty(badchanstr)
            badchanindx = str2num(badchanstr);
            if ~isempty(badchanindx)
                % Interpolation
                EEG = pop_interp(EEG, badchanindx, 'spherical');
            end
        end

        %re-reference to average of all channels, exclude none
        EEG = pop_reref(EEG, reref_input, 'keepref','on'); % (EEG, refchan# []=all, 'exclude', [chan#s to exclude from ref])  % change chan#s if using diff system. For Mastoid referencing: pop_reref( EEG, [17, 22] );

        % Save dataset
        EEG.setname = sprintf('%s_%s_%s_%s_%s_INTP_%s', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name); % subject's filename
        EEG = pop_saveset(EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write);
        clear EEG
    end
    end
end
