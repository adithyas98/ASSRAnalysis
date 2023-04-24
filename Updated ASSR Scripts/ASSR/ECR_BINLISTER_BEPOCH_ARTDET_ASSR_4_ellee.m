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

pathname_source = 'F:\ECR_Reading_EEG_data\processed_data\';%% Subject and Recording Properties
%%
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
%% Bin the Average Re-referenced Data (For TFA)

% Bin descriptor file
% AdaptiveP3_BDFile = 'C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\bins\AdaptiveP3_2-2-18.txt'; % Before Target and Target start fixation
% MMN_BDFile = 'C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\bins\CreepE_12-27-18.txt';
% QEEG_BDFile = 'C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\bins\QEEG_8-1-18.txt';
% P50_BDFile = 0;
% GammaAOD_BDFile = 0;
% AUD_BDFile = 'C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\bins\CreepE_12-27-18.txt';
ASSR_BDFile = 'C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\bins\ASSR_09_Feb_21.txt';


% Specify Re-referencing Type 
    ref_type = 2; % (1=average, 2=mastoid)
    
    if ref_type==1
        ref_type_name = 'Average_REF';
        reref_input = [];
    elseif ref_type==2
        ref_type_name = 'Mastoid_REF';
        reref_input = [17, 22];
    end

a=1
subjs = importlist(['F:\ECR_Reading_EEG_data\subject_lists\' tasks{a} '\' study '_' tasks{a} '_' group_name '_subjs.txt']); % import subject list

for s=1:length(subjs)
    for p=1:length(ASSR_trial)
  
    pathname_read = [pathname_source '\' group_name '\' tasks{a} '\' ref_type_name '\' study '-' group '-' subjs{s}];
    pathname_write = [pathname_source '\' group_name '\' tasks{a} '\BEPOCH.' ref_type_name '\' study '-' group '-' subjs{s}];

    % if folder doesn't exist then make it
    if exist(pathname_write, 'dir')==0
        mkdir(pathname_write);
    end

    sname = sprintf('%s_%s_%s_%s_%s_INTP_%s', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name); % subject's filename 
    fname = fullfile(pathname_read, [sname '.set']); %

    if exist(fname, 'file')>0

          % load file and convert it into EEG structure
          fprintf('Processing Subject %s\n', [sname '.set'])
          EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);

          % Create EVENTLIST
          EEG = pop_creabasiceventlist( EEG , 'AlphanumericCleaning', 'on', 'BoundaryNumeric', { -99 }, 'BoundaryString', { 'boundary' } );

          % Capture Bins
          if strcmp(tasks{a}, 'P300')
              EEG = pop_binlister( EEG , 'BDF', AdaptiveP3_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'MMN')
              EEG = pop_binlister( EEG , 'BDF', MMN_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'QEEG')
              EEG = pop_binlister( EEG , 'BDF', QEEG_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'P50')
              EEG = pop_binlister( EEG , 'BDF', P50_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'GammaAOD')
              EEG = pop_binlister( EEG , 'BDF', GammaAOD_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'ASSR')
              EEG = pop_binlister( EEG , 'BDF', ASSR_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'AUD')
              EEG = pop_binlister( EEG, 'BDF', AUD_BDFile, 'IndexFL', 1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          end

          % Bin-Epoch dataset
          EEG = pop_epochbin( EEG , [-1000 2000],  [-300 0]);

          % Artifact detection
          EEG  = pop_artmwppth( EEG , 'Channel',  1:EEG.nbchan, 'Flag',  1, 'Threshold',  120, 'Twindow', [ -100 400], 'Windowsize',  200, 'Windowstep',  100 );

          % Save dataset
          EEG.setname = sprintf('%s_%s_%s_%s_%s_BEPOCH.%s', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name); % subject's filename
          EEG = pop_saveset( EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write);

          clear EEG
    else
          fprintf('\n *** WARNING: %s does not exist *** \n\n', fname);
    end
    end
end
%% Bin the Data (For ERP [if not average re-referenced]) - DONT NEEEEEEEEEEEED

% Data for TF analysis would be average re-referenced. If a different
% reference type is desired for ERP analysis then specify below and run the
% following script

% Specify Re-referencing Type 
ref_type = 2; % (1=average, 2=mastoid)

if ref_type==1
    ref_type_name = 'Average_REF';
elseif ref_type==2
    ref_type_name = 'Mastoid_REF';
end

% Bin descriptor file
AdaptiveP3_BDFile = 'C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\bins\AdaptiveP3_2-2-18.txt'; % Before Target and Target start fixation
MMN_BDFile = 'C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\bins\CreepE_12-27-18.txt';
QEEG_BDFile = 'C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\bins\QEEG_8-1-18.txt';
P50_BDFile = 0;
GammaAOD_BDFile = 0;
AUD_BDFile = 'C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\bins\CreepE_12-27-18.txt';

for a=1:length(tasks)

    pathname_read  = [pathname_source phase '\' tasks{a} '\' ref_type_name '\' subject];
    pathname_write = [pathname_source phase '\' tasks{a} '\BEPOCH.' ref_type_name '\' subject];
    
    % if folder doesn't exist then make it
    if exist(pathname_write, 'dir')==0
        mkdir(pathname_write);
    end

    sname = sprintf('%s_%s_%s_INTP_%s_cleaned', subject, phase, tasks{a}, ref_type_name); % subject's filename 
    fname = fullfile(pathname_read, [sname '.set']); %

    if exist(fname, 'file')>0

          % load file and convert it into EEG structure
          fprintf('Processing Subject %s\n', [sname '.set'])
          EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);

          % Create EVENTLIST
          EEG = pop_creabasiceventlist( EEG , 'AlphanumericCleaning', 'on', 'BoundaryNumeric', { -99 }, 'BoundaryString', { 'boundary' } );

          % Capture Bins
          if strcmp(tasks{a}, 'P300')
              EEG = pop_binlister( EEG , 'BDF', AdaptiveP3_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'MMN')
              EEG = pop_binlister( EEG , 'BDF', MMN_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'QEEG')
              EEG = pop_binlister( EEG , 'BDF', QEEG_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'P50')
              EEG = pop_binlister( EEG , 'BDF', P50_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'GammaAOD')
              EEG = pop_binlister( EEG , 'BDF', GammaAOD_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          elseif strcmp(tasks{a}, 'AUD')
              EEG = pop_binlister( EEG , 'BDF', AUD_BDFile, 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' );
          end

          % Bin-Epoch dataset
          EEG = pop_epochbin( EEG , [-1000 1000],  [-300 0]);

          % Artifact detection
          EEG  = pop_artmwppth( EEG , 'Channel',  1:EEG.nbchan, 'Flag',  1, 'Threshold',  120, 'Twindow', [ -100 400], 'Windowsize',  200, 'Windowstep',  100 );

          % Save dataset
          EEG.setname = sprintf('%s_%s_%s_BEPOCH.%s', subject, phase, tasks{a}, ref_type_name); % subject's filename
          EEG = pop_saveset( EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write);

          clear EEG
    else
          fprintf('\n *** WARNING: %s does not exist *** \n\n', fname);
    end
end
end
