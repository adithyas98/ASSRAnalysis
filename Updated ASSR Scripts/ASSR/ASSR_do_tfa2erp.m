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

%%
data_type_name = 'ITC' %ITC, Epower

if strcmp(data_type_name, 'ITC') %0 for power, 1 for phase, 3 for ITC scroll down!!!!!!!!
        datatype = 3;
elseif  strcmp(data_type_name, 'Tpower')
        datatype = 0;
elseif  strcmp(data_type_name, 'Epower')
        datatype = 0;
end
        
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
%%
% convert TFA to ERP
    
    %NOTE:  you get the specific frequency bands that you want to average across
    %by looking at TFA 'freq' field, alternatively you can use [8:12] to
    %specify all bands between 8 and 12Hz, the program will pick specific
    %freq bins closest to 8 and 12 and all bins in between
    %% ALPHA- 8-12.5Hz ----------------------------------------------------------------------------------------
%%FOR TPOWER AND EPOWER ONLY - scroll to bottom for ITC (it uses slightly diff function because datatype is diff)


for s=1:length(subjs)
    for p=1:length(ASSR_trial)

pathname_writeerp = ['F:\ECR_Reading_EEG_data\processed_data\' group_name '\' tasks{a} '\TFA\' ref_type_name '\Tfa2erp\']
pathname_loadtfa = ['F:\ECR_Reading_EEG_data\processed_data\' group_name '\' tasks{a} '\TFA\' ref_type_name '\' study '-' group '-' subjs{s}]

FileName = sprintf('%s_%s_%s_%s_%s_%s_TFA_%s.tfa', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name, data_type_name);
TFA = loadTFA('filename',FileName,'filepath',pathname_loadtfa);

ERP = tfa2erp(TFA, [8:12.5], datatype); % Power  %%frequency range to extract, e.g. 9Hz to 12Hz

% Save ERP 
erpname = sprintf('%s_%s_%s_%s_%s_%s_TFA_%s_alpha_8-12.5Hz', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name, data_type_name);  
   %_theta_4-8Hz
   %_alpha_8-12.5Hz
   %_beta_12.5-24Hz
   
ERP  = pop_savemyerp(ERP, 'erpname', erpname, 'filename', [erpname '.erp'], 'filepath', pathname_writeerp);

clear ERP
clear TFA
    end
end
%
%%
%ITC Alpha
clear ERP
clear TFA

 for s=1:length(subjs)
    for p=1:length(ASSR_trial)

pathname_writeerp = ['F:\ECR_Reading_EEG_data\processed_data\' group_name '\' tasks{a} '\TFA\' ref_type_name '\Tfa2erp\']
pathname_loadtfa = ['F:\ECR_Reading_EEG_data\processed_data\' group_name '\' tasks{a} '\TFA\' ref_type_name '\' study '-' group '-' subjs{s}]

FileName = sprintf('%s_%s_%s_%s_%s_%s_TFA_%s.tfa', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name, data_type_name);
TFA = loadTFA('filename',FileName,'filepath',pathname_loadtfa);

ERP = tfa2erp_ITC_ellee(TFA, [8:12.5], datatype); % Power  %%frequency range to extract, e.g. 9Hz to 12Hz

erpname = sprintf('%s_%s_%s_%s_%s_%s_TFA_%s_alpha_8-12.5Hz', study, group, subjs{s}, tasks{a}, ASSR_trial{p}, ref_type_name, data_type_name);
   %_theta_4-8Hz
   %_alpha_8-12.5Hz
   %_beta_12.5-24Hz
   
   
   ERP  = pop_savemyerp(ERP, 'erpname', erpname, 'filename', [erpname '.erp'], 'filepath', pathname_writeerp);

    clear ERP
    clear TFA
    end
 end

