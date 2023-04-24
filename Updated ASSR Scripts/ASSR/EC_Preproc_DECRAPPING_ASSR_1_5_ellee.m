% Authors: Blair Vail & Michael Avissar 
%Edited by Ellee for CVN data
% NYSPI
% New York, NY 
% 2019

%This program removes Commonly Recorded Artefactual Potentials (CRAP) using EEGLab on data that has been preprocessed
%(Step 1).  It outputs de-CRAPed data and a text file with the amount of data that was removed.

% Authors: Abe & Pejman
% Nathan Kline Institute
% Orangeburg, NY 10962
% 2018
%edited - directories changed for Ellee's computer

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
pathname_destination = 'F:\ECR_Reading_EEG_data\processed_data\'; % Subdirectory for exporting EEG files after conversion for EEGLab
pathchanlocs = 'C:Users\debaunh\Documents\MATLAB\Columbia_scripts\Standard Brainvision 64 channel cap.elp'; % Electrode Location File (for topographies)
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
cd(['F:\ECR_Reading_EEG_data\processed_data\' group_name '\Artifact_rejection_summary'])

%% 

Peak2PeakRej = 300; %peak to peak rejection threshold (if one number, this means +/- that number: 300 means +/-300)
WindowSize = 400; %duration of window to peform rejection (ms)
WindowStep = 200; %duration of window step size for rejection (ms)
BlinkChannels = [ 1 2 ];  %array of channel indices for external and blink heavy channels (eg. Fp1, Fp2, external channels)
%% 


a=1
subjs = importlist(['F:\ECR_Reading_EEG_data\subject_lists\' tasks{a} '\' study '_' tasks{a} '_' group_name '_subjs.txt']); % import subject list

for s=1:length(subjs)
    for p=1:length(ASSR_trial)
        
        % initialize output file to capture % data loss:
fileID = fopen(['Summary_ContArtRej_' study '-' group '-' subjs{s} '-' ASSR_trial{p} '.txt'],'w');
fprintf(fileID,'Subject\tPercentDataLoss\r\n');
        
% assign directories:
pathname_read  = [pathname_source '\' group_name '\' tasks{a} '\PREPRO_MERGED\' study '-' group '-' subjs{s}];
pathname_write = [pathname_source '\' group_name '\' tasks{a} '\PREPRO_MERGED_CRAPOUT\' study '-' group '-' subjs{s}]; %to write

%subject's input file/set name
sname = sprintf('%s_%s_%s_%s_%s_ALLMERGED', study, group, subjs{s}, tasks{a}, ASSR_trial{p});
fname = fullfile(pathname_read, [sname '.set']); % now including whole path and extension .vhdr

% if destination group folder doesn't exist then make it
if exist(pathname_write, 'dir')==0
   mkdir(pathname_write);
end

%load current datat set
EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);

% designate which channels to scan for CRAP (badchans from preproc. & Fp's should not be scanned):
chan4crap = 1:64; %set to include all channels and subsequent steps will exclude bad channels
badchanindx = str2num(EEG.condition); %#ok<ST2NM>
chan4crap = chan4crap(~ismember(chan4crap,badchanindx));

NumPointsBefore = EEG.pnts; %record number of data points before rejection

chanNoEOG = chan4crap(~ismember(chan4crap, BlinkChannels )); % IMPORTANT: skip channels having large eyeblinks (e.g. Fp1, Fp2, or bipolar EOG chans, if present)
% if you dont skip those channels then most of the c.r.a.p.
% capturing will consist of eye blinks...you dont want that...

% mark sections containing amplitudes greater than 'ampth' parameter:
[EEG, WinRej] = pop_continuousartdetMA( EEG , 'ampth', Peak2PeakRej, 'chanArray',  chanNoEOG,...
'colorseg', [ 1 0.9765 0.5294], 'firstdet', 'on','shortisi',  500, 'stepms',  WindowStep, 'winms',  WindowSize ); %'shortisi' parameter should be set to the isi of the task you're analysing

EEG = eeg_eegrej( EEG, WinRej);   % this step removes the marked segments       
EEG = eeg_checkset( EEG );

%record number of data points before rejection & calculate data loss:
NumPointsAfter  = EEG.pnts; 
percentDataLoss = (NumPointsBefore - NumPointsAfter)/NumPointsBefore * 100; 
% print percent data loss to output file:
subject = ([study '-' group '-' subjs{s}])
fprintf(fileID,'%s\t%g\r\n', subject, percentDataLoss);
fclose(fileID);

outputFname = sprintf('%s_%s_%s_%s_%s_ALLMERGED_crapout', study, group, subjs{s}, tasks{a}, ASSR_trial{p}); %subject's output file name 
%change data set name and save processed data set.
EEG.setname=outputFname;
EEG = pop_saveset( EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write);
end
end