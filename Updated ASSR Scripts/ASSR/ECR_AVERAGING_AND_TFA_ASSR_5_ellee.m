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
cd('C:\Users\debaunh\Documents\MATLAB\Columbia_scripts')
addpath('C:\Users\debaunh\Documents\MATLAB\eeglab13_4_4b');
addpath('C:\Users\debaunh\Documents\MATLAB\Columbia_scripts\functions');
eeglab

pathname_source = 'F:\ECR_Reading_EEG_data\processed_data\';
%% %% Subject and Recording Properties

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
%%
%Import subjects and set reference type
a=1;
subjs = importlist(['F:\ECR_Reading_EEG_data\subject_lists\' tasks{a} '\' study '_' tasks{a} '_' group_name '_subjs.txt']); % import subject list

% Specify Re-referencing Type 
    ref_type = 2; % (1=average, 2=mastoid)
    
    if ref_type==1
        ref_type_name = 'Average_REF';
        reref_input = [];
    elseif ref_type==2
        ref_type_name = 'Mastoid_REF';
        reref_input = [17, 22];
    end
%%
%ERPs
for s = 1:length(subjs)
    for p = 1:length(ASSR_trial)
        
    pathname_read     = [pathname_source '\' group_name '\' tasks{a} '\BEPOCH.' ref_type_name '\' study '-' group '-' subjs{s}];
    pathname_write    = [pathname_source '\' group_name '\' tasks{a} '\ERPs.' ref_type_name '\' study '-' group '-' subjs{s}];
    
    % if folder doesn't exist then make it
    if exist(pathname_write, 'dir')==0
        mkdir(pathname_write);
    end
 

    %%%%%%%%ENTER NUMBER OF BINS HERE%%%%%%%
    if strcmp(tasks{a},'P300')
        nbin = 7;% WARNING: this depends on the definition of bins at your Bin descriptor file!
    elseif strcmp(tasks{a},'MMN')
        nbin = 7;
    elseif strcmp(tasks{a},'QEEG')
        nbin = 2;
    elseif strcmp(tasks{a},'P50')
        nbin = 0;
    elseif strcmp(tasks{a},'GammaAOD')
        nbin = 0;
    elseif strcmp(tasks{a}, 'ASSR')
        nbin = 6;
    elseif strcmp(tasks{a}, 'AUD')
        nbin = 7;
    end

    sname = sprintf('%s_%s_%s_%s_%s_BEPOCH.%s', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name); % subject's filename
    fname = fullfile(pathname_read, [sname '.set']); % now including whole path and extension .vhdr

    if exist(fname, 'file')>0

          % load file and convert it into EEG structure
          EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_read);

          % Average ERPs
          ERP = pop_averager( EEG , 'Criterion', 'good', 'ExcludeBoundary', 'on', 'SEM', 'on' ); %change if need shorter ERP averages

          if nbin~=ERP.nbin
              error('Script:DifferentNumberOfBins','ERP from %s does not have %g bins, it has %g!\n', sname, nbin, ERP.nbin);
          end
          
          % Save ERP
          erpname = sprintf('%s_%s_%s_%s_%s_%s_ERP', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name);
          ERP  = pop_savemyerp(ERP, 'erpname', erpname, 'filename', [erpname '.erp'], 'filepath', pathname_write);
    end
    end
end
%%
 % TFA
 
 %load erp
 clear ERP
 clear EEG

% Specify Re-referencing Type 
    ref_type = 2; % (1=average, 2=mastoid)
    
    if ref_type==1
        ref_type_name = 'Average_REF';
        reref_input = [];
    elseif ref_type==2
        ref_type_name = 'Mastoid_REF';
        reref_input = [17, 22];
    end
    
    
  for s = 1:length(subjs)
    for p = 1:length(ASSR_trial)
     
        pathname_writetfa = [pathname_source '\' group_name '\' tasks{a} '\TFA\' ref_type_name '\' study '-' group '-' subjs{s} '\Test_diff_freq_range\'];
    
        if exist(pathname_writetfa, 'dir')==0
        mkdir(pathname_writetfa);
        end
        
%load EEG
    pathname_EEG     = [pathname_source '\' group_name '\' tasks{a} '\BEPOCH.' ref_type_name '\' study '-' group '-' subjs{s}];
    sname = sprintf('%s_%s_%s_%s_%s_BEPOCH.%s', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name); % subject's filename
    EEG = pop_loadset('filename', [sname '.set'], 'filepath', pathname_EEG);
              
%load erp
    pathname_erp = [pathname_source '\' group_name '\' tasks{a} '\ERPs.' ref_type_name '\' study '-' group '-' subjs{s}];
    erpname = sprintf('%s_%s_%s_%s_%s_%s_ERP', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name);
    ERP = pop_loaderp( 'filename', [erpname '.erp'], 'filepath', pathname_erp);
 
 %TFA Properties for all 3 types (Tpower, ITC, evokedPower)
          omega = 5;  % # of cycles. 3 is good for lower frequency, 6 is better for higher
          binArray = 1:ERP.nbin; %all bins (6 for ASSR)
          nElecs = 1:ERP.nchan; % for all
          baseline_correction_window = [-300 0]; % in ms
          frequency_range = [0.5 50]; % was [0.5 50] before
              
          % Total Power: (chk nElecs)
                  %no baselining
                  baseline_correction_type = 'none'; % type of baseline correction
                  TFA = TimeFrequencyAverager(EEG, ERP, binArray, nElecs, frequency_range, omega, baseline_correction_window, baseline_correction_type, 0); % change as needed
                  tfasetname = sprintf('%s_%s_%s_%s_%s_%s_TFA_Tpower', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name);
                  filenameTFA = fullfile(pathname_writetfa, [tfasetname '.tfa']); % now including whole path and extension .vhdr
                  TFA.setname  = tfasetname;
                  save(filenameTFA, 'TFA');
          
                  clear TFA
                  clear baseline_correction_type
                  
          % TFA ITC, baseline doesn't change anything
                  baseline_correction_type = 'none'; %no baselining available for ITC
                  TFA = TimeFrequencyAverager(EEG, ERP, binArray, nElecs, frequency_range, omega, baseline_correction_window, baseline_correction_type, 3);
                  tfasetname = sprintf('%s_%s_%s_%s_%s_%s_TFA_ITC', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name);
                  filenameTFA = fullfile(pathname_writetfa, [tfasetname '.tfa']); % now including whole path and extension .vhdr
                  TFA.setname  = tfasetname;
                  save(filenameTFA, 'TFA');
                  
                  clear TFA
                  clear baseline_correction_type

          % TFA evoked power - no baseline (already "baselined" due to
          % being calculated from averaged ERP)
                  baseline_correction_type = 'none';
                  fprintf('AVINOT: CALCULATING EVOKED POWER\n')
                  TFA = GetEvokedTimeFrequency(ERP, binArray, nElecs, frequency_range, omega, baseline_correction_window, baseline_correction_type, 1); %1 at end means include phase
                  tfasetname = sprintf('%s_%s_%s_%s_%s_%s_TFA_Epower', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name);
                  filenameTFA = fullfile(pathname_writetfa, [tfasetname '.tfa']); % now including whole path and extension .vhdr
                  TFA.setname  = tfasetname;
                  save(filenameTFA, 'TFA');

                  clear TFA
                  clear baseline_correction_type

          clear ERP EEG TFA
          clc
   
    end
  end

%% Examine Individual TFA plots

task = 'AUD';
filename = sprintf('%s_%s_%s_TFA.tfa', subject, phase, task);
filepath = [pathname_source phase '\' tasks{a} '\TFA'];

TFA = loadTFA('filename',filename,'filepath',filepath); %load TFA file to plot

datatype = 3; % 0=power; 1=phase; 2=amplitude; 3=ITC (you can specify more than one value)
binArray = [1]; % Bin indices to plot
chanArray = [18]; % Maximum number of channels = TFA.nchan
amprange = [0 0.5]; % Amplitude range (Z-scale) (displayed as colormap) to plot.
twindow = [-500 1500 -500:250:1500]; % Time window where the first two numbers are the min and max and then remaining numbers designate the ticks
fwindow = [1 90    1  5 8 10  12 15 18 20 25 30 35 40 45 50 60 70 80 100 ]; % Time frequency window structured similarly to the twindow
blcwin = [-300 0]; % Baseline correction window
blctype = 'none'; % 'Divisive' or 'none' are the other types 'subtractive'
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