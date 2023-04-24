% Authors: Blair Vail & Michael Avissar 
%Edited by Ellee for tmpap- 2020, NYSPI

%This program removes Commonly Recorded Artefactual Potentials (CRAP) using EEGLab on data that has been preprocessed
%(Step 1).  It outputs de-CRAPed data and a text file with the amount of data that was removed.

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

subjs = dir([pathname_source '\PREPRO\']);
subjectfolderflag = [subjs.isdir];%We want to know if the item is a directory
subjs = {subjs(subjectfolderflag).name};
subjs = subjs(3:end);%we want to cut out the first two file names which are '.' and '..'
trial_type = '40-500ms'; %80, 05, 12, 40-500ms
 
Peak2PeakRej = 300; %peak to peak rejection threshold (if one number, this means +/- that number: 300 means +/-300)
WindowSize = 400; %duration of window to peform rejection (ms)
WindowStep = 200; %duration of window step size for rejection (ms)
BlinkChannels = [ 1 2 ];  %array of channel indices for external and blink heavy channels (eg. Fp1, Fp2, external channels)
%
badFiles = {};
for s=1:length(subjs)
    for assesmentType={'PRE','POST','POST1'}
        % initialize output file to capture % data loss:

        subject = [subjs{s}(5:6) '-' subjs{s}(8:11)];

        if exist([pathname_source '\ContArtRej_1'], 'dir')==0
            mkdir([pathname_source '\ContArtRej_1']);
        end

        cd([pathname_source '\ContArtRej_1'])

        fileID = fopen(['Summary_ContArtRej_' subject '_' trial_type '.txt'],'w');
        fprintf(fileID,'Subject\tPercentDataLoss\r\n');

        % assign directories:
        pathname_read  = [pathname_source '\PREPRO\' subjs{s}];
        pathname_write = [pathname_source '\PREPRO_CRAPOUT\' subjs{s}];

        % if folder doesn't exist then make it
        if exist(pathname_write, 'dir')==0
            mkdir(pathname_write);
        end

        %subject's input file/set name
        subject_short = [subjs{s}(5:6) '-' subjs{s}(8:11)];
        %sname =  sprintf('ASSR-%s-%s-%s-PREPRO-merged', subject, trial_type,assesmentType{1}); % subject's filename
        sname =  sprintf('ASSR-%s-%s-PREPRO-merged', subject, trial_type); % subject's filename
        fname = fullfile(pathname_read, [sname '.set']); % now including whole path and extension .vhdr

        %load current datat set
        try
            EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);
        catch
            badFiles{end+1} = sname;
            continue;
        end

        % designate which channels to scan for CRAP (badchans from preproc. & Fp's should not be scanned):
        chan4crap = 1:64; %set to include all channels and subsequent steps will exclude bad channels

        NumPointsBefore = EEG.pnts; %record number of data points before rejection

        chanNoEOG = chan4crap(~ismember(chan4crap, BlinkChannels )); % IMPORTANT: skip channels having large eyeblinks (e.g. Fp1, Fp2, or bipolar EOG chans, if present)
        % if you dont skip those channels then most of the c.r.a.p.
        % capturing will consist of eye blinks...you dont want that...

        % mark sections containing amplitudes greater than 'ampth' parameter:
        [EEG, WinRej] = pop_continuousartdetMA( EEG , 'ampth', Peak2PeakRej, 'chanArray',  chanNoEOG,...
        'colorseg', [ 1 0.9765 0.5294], 'firstdet', 'on','shortisi',  1000, 'stepms',  WindowStep, 'winms',  WindowSize ); %'shortisi' parameter should be set to the isi of the task you're analysing, 1000ms between T1 and T2

        EEG = eeg_eegrej( EEG, WinRej);   % this step removes the marked segments       
        EEG = eeg_checkset( EEG );

        %record number of data points before rejection & calculate data loss:
        NumPointsAfter  = EEG.pnts; 
        percentDataLoss = (NumPointsBefore - NumPointsAfter)/NumPointsBefore * 100; 
        % print percent data loss to output file:
        fprintf(fileID,'%s\t%g\r\n', subject, percentDataLoss);
        fclose(fileID);

        %outputFname = sprintf('ASSR-%s-%s-%s-PREPRO-crapout', subject, trial_type,assesmentType{1});
        outputFname = sprintf('ASSR-%s-%s-PREPRO-crapout', subject, trial_type);

        %change data set name and save processed data set.
        EEG.setname=outputFname;
        EEG = pop_saveset( EEG,  'filename', [EEG.setname  '.set'], 'filepath', pathname_write);
        clear EEG
        clear fileID
    end
end
disp("Done");