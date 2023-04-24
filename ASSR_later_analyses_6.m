clear all
close all
pack
clc

addpath('C:\Users\debaunh\OneDrive - cumc.columbia.edu\Documents\MATLAB\eeglab2020_0\');
addpath('C:\Users\debaunh\OneDrive - cumc.columbia.edu\Documents\MATLAB')
addpath('C:\Users\debaunh\OneDrive - cumc.columbia.edu\Documents\MATLAB\Columbia_scripts\functions');
eeglab

pathname_source = 'F:\ASSR\processed_data';

%% Trial Properties
trial_type = '40-500ms' %80, 05, 12, 40-500ms

%%  TF Analysis + Average Re-Referenced ERPs

%%Controls
subjs = {'00-0006'
'00-0008'
'00-0009'
'00-0011'
'00-0012'
'00-0013'
'00-0014'
'00-0015'}

%-500_BL_TPower_3cycle
clear subject

subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_00_GrandAverage_8subjs_-500_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%-500_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_00_GrandAverage_8subjs_-500_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%No_BL_TPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_00_GrandAverage_8subjs_No_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%No_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_00_GrandAverage_8subjs_No_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%ITC_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_00_GrandAverage_8subjs_ITC_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%ITC_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_00_GrandAverage_8subjs_ITC_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');


%EvokedPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_00_GrandAverage_8subjs_Epower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%EvokedPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_00_GrandAverage_8subjs_Epower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');
%%

%%CHR

subjs = {'04-0003'
'04-0005'
'04-0008'
'04-0009'
'04-0010'
'04-0011'
'04-0012'
'04-0014'
'04-0015'
'04-0016'
'04-0017'
'04-0018'
'04-0019'
'04-0022'
'04-0026'
'04-0027'
'04-0029'}

%-500_BL_TPower_3cycle
clear subject

subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_04_GrandAverage_17subjs_-500_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%-500_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_04_GrandAverage_17subjs_-500_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%No_BL_TPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_04_GrandAverage_17subjs_No_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%No_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_04_GrandAverage_17subjs_No_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%ITC_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_04_GrandAverage_17subjs_ITC_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%ITC_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_04_GrandAverage_17subjs_ITC_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');


%EvokedPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_04_GrandAverage_17subjs_Epower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%EvokedPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_04_GrandAverage_17subjs_Epower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');
%%
%%FE

subjs = {'03-0002'
'03-0003'
'03-0004'
'03-0005'
'03-0006'
'03-0007'
'03-0008'
'03-0009'}

%-500_BL_TPower_3cycle
clear subject

subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_03_GrandAverage_8subjs_-500_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%-500_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_03_GrandAverage_8subjs_-500_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%No_BL_TPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_03_GrandAverage_8subjs_No_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%No_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_03_GrandAverage_8subjs_No_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%ITC_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_03_GrandAverage_8subjs_ITC_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%ITC_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_03_GrandAverage_8subjs_ITC_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');


%EvokedPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_03_GrandAverage_8subjs_Epower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%EvokedPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_03_GrandAverage_8subjs_Epower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%%
%Chronic Patients - 08

subjs = {'08-0001'
'08-0002'
'08-0003'
'08-0004'
'08-0005'
'08-0006'
'08-0008'
'08-0009'
'08-0010'
'08-0011'
'08-0013'
'08-0014'
'08-0015'}

%-500_BL_TPower_3cycle
clear subject

subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_08_GrandAverage_13subjs_-500_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%-500_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_08_GrandAverage_13subjs_-500_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%No_BL_TPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_08_GrandAverage_13subjs_No_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%No_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_08_GrandAverage_13subjs_No_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%ITC_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_08_GrandAverage_13subjs_ITC_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%ITC_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_08_GrandAverage_13subjs_ITC_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');


%EvokedPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_08_GrandAverage_13subjs_Epower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%EvokedPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_08_GrandAverage_13subjs_Epower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%%
%NonHallucinators

%%Controls
subjs = {'00-0006'
'00-0008'
'00-0009'
'00-0011'
'00-0012'
'00-0013'
'00-0014'
'00-0015'
'04-0003'
'04-0005'
'04-0008'
'04-0009'
'04-0010'
'04-0011'
'04-0012'
'04-0014'
'04-0015'
'04-0016'
'04-0017'
'04-0018'
'04-0019'
'04-0022'
'04-0026'
'04-0027'
'04-0029'
'03-0003'
'03-0005'
'03-0008'
'03-0009'
'08-0003'
'08-0009'
'08-0014'}

%-500_BL_TPower_3cycle
clear subject

subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHallucinators_GrandAverage_32subjs_-500_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%-500_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHallucinators_GrandAverage_32subjs_-500_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%No_BL_TPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHallucinators_GrandAverage_32subjs_No_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%No_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHallucinators_GrandAverage_32subjs_No_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%ITC_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHallucinators_GrandAverage_32subjs_ITC_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%ITC_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHallucinators_GrandAverage_32subjs_ITC_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject
%EvokedPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHallucinators_GrandAverage_32subjs_Epower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%EvokedPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0006_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0008_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0009_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0011_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0012_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0013_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0014_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-00-0015_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0003_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0005_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0008_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0009_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0010_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0011_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0012_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0014_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0015_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0016_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0017_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0018_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0019_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0022_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0026_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0027_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-04-0029_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHallucinators_GrandAverage_32subjs_Epower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%%
subjs = {'08-0001'
'08-0002'
'08-0004'
'08-0005'
'08-0006'
'08-0008'
'08-0010'
'08-0011'
'08-0013'
'08-0015'
'03-0002'
'03-0004'
'03-0006'
'03-0007'}

%-500_BL_TPower_3cycle
clear subject

subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_Hallucinators_GrandAverage_14subjs_-500_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%-500_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_Hallucinators_GrandAverage_14subjs_-500_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%No_BL_TPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_Hallucinators_GrandAverage_14subjs_No_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%No_BL_TPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_Hallucinators_GrandAverage_14subjs_No_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%ITC_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_Hallucinators_GrandAverage_14subjs_ITC_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%ITC_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_Hallucinators_GrandAverage_14subjs_ITC_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');


%EvokedPower_3cycle
subject = {['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_Hallucinators_GrandAverage_14subjs_Epower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%EvokedPower_6cycle
subject = {['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0001_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0002_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0004_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0005_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0006_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0008_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0010_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0011_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0013_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0015_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0002_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0004_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0006_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0007_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_Hallucinators_GrandAverage_14subjs_Epower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');
%%
%NonHallucinators - chronic and FE only

%%Controls
subjs = {
'03-0003'
'03-0005'
'03-0008'
'03-0009'
'08-0003'
'08-0009'
'08-0014'}

%-500_BL_TPower_3cycle
clear subject

subject = {
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHall_chronic_and_FE_only_GrandAverage_7subjs_-500_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%-500_BL_TPower_6cycle
subject = {
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_-500_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHall_chronic_and_FE_only_GrandAverage_7subjs_-500_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%No_BL_TPower_3cycle
subject = {
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHall_chronic_and_FE_only_GrandAverage_7subjs_No_BL_TPower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%No_BL_TPower_6cycle
subject = {
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_No_BL_TPower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHall_chronic_and_FE_only_GrandAverage_7subjs_No_BL_TPower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%ITC_3cycle
subject = {
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_ITC_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHall_chronic_and_FE_only_GrandAverage_7subjs_ITC_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%ITC_6cycle
subject = {
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_ITC_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 3); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHall_chronic_and_FE_only_GrandAverage_7subjs_ITC_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject
%EvokedPower_3cycle
subject = {
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']
    ['F:\ASSR\processed_data\TFA_3cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_Epower_3cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHall_chronic_and_FE_only_GrandAverage_7subjs_Epower_3cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

clear TFA tfasetname filename TFA
clear subject

%%EvokedPower_6cycle
subject = {
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0003_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0005_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0008_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-03-0009_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0003_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0009_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']
    ['F:\ASSR\processed_data\TFA_6cycle\ASSR_ECR-08-0014_' trial_type '_Average_REF_TFA_Epower_6cycle.tfa']}

TFA = GrandAveragerTFA(subject, 0); %type of data to work on specified after comma: 0=power; 1=phase; 2=amplitude; 3=ITC
                                                                       
tfasetname = ['ASSR_ECR_NonHall_chronic_and_FE_only_GrandAverage_7subjs_Epower_6cycle']; %ITC, Baselined_TPower
filenameTFA = fullfile(['F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\'], [tfasetname '.tfa']); 
TFA.setname  = tfasetname;
save(filenameTFA, 'TFA');

%
%%
%creating TFA subtractions

filename = 'ASSR_ECR_Hallucinators_GrandAverage_14subjs_-500_BL_TPower_6cycle.tfa'
filepath = 'F:\ASSR\processed_data\TFA_6cycle\Grand_Averages'

TFA = loadTFA('filename',filename,'filepath',filepath);
TP3 = TFA

filename = 'ASSR_ECR_NonHallucinators_GrandAverage_32subjs_-500_BL_TPower_6cycle.tfa'
filepath = 'F:\ASSR\processed_data\TFA_6cycle\Grand_Averages'

TFA = loadTFA('filename',filename,'filepath',filepath);
TP1 = TFA

DTFA = TFA

DTFA.setname = '-500_BL_TPower_6cycle_Diff_Hallucinators14subjs_minus_NonHall32subjs'
DTFA.freqdata.Bin(1).Power = TP3.freqdata.Bin(1).Power - TP1.freqdata.Bin(1).Power;
%DTFA.freqdata.Bin(1).ITC = TP3.freqdata.Bin(1).ITC - TP1.freqdata.Bin(1).ITC; %for ITC

DTFA.minfreq = min(DTFA.freq); 
DTFA.maxfreq = max(DTFA.freq);

clear TFA

TFA = DTFA

tfasetname = DTFA.setname
   filenameTFA = fullfile('F:\ASSR\processed_data\TFA_6cycle\Grand_Averages\Subtraction_TFAs\', [tfasetname '.tfa']); 
   TFA.setname  = tfasetname;
   save(filenameTFA, 'TFA');
%% Examine Individual TFA plots

filename = 'ASSR_ECR_NonHall_chronic_and_FE_only_GrandAverage_7subjs_-500_BL_TPower_3cycle.tfa' %ASSR_ECR_NonHallucinators_GrandAverage_32subjs_ITC_3cycle.tfa
%ASSR_ECR_Hallucinators_GrandAverage_14subjs_ITC_3cycle
filepath = 'F:\ASSR\processed_data\TFA_3cycle\Grand_Averages\'

TFA = loadTFA('filename',filename,'filepath',filepath); %load TFA file to plot

datatype = 0; % 0=power; 1=phase; 2=amplitude; 3=ITC (you can specify more than one value)
binArray = [1]; % Bin indices to plot
chanArray = [56]; % Maximum number of channels = TFA.nchan
amprange = [-1 2]; % Amplitude range (Z-scale) (displayed as colormap) to plot.
twindow = [-500 1000 -500:250:1000]; % Time window where the first two numbers are the min and max and then remaining numbers designate the ticks
fwindow = [0.5 12.5    1 5 8 10 12.5]; % Time frequency window structured similarly to the twindow
fwindow = [12.5 50   12.5 16 24 30 40 50]; % Time frequency window structured similarly to the twindow
blcwin = [-100 0]; % Baseline correction window
blctype = 'none'; % 'Divisive' or 'none' are the other types
fshading = 'interp'; % Controls of color shading. Can be 'flat' or  'interp'.
fcontour = 'off'; % displays isolines calculated from matrix Z and fills the areas between the isolines using constant colors corresponding to the current figure's colormap. Can be 'on' or  'off'.
Ylog = 1; % Logarithmic scale for frequency range (fwindow). Can be 1 (means apply log scale)  or  0 (means apply linear scale).
plotype = 1; % Plotting style: 0 means topographic; 1 means rectangular array. IMPORTANT: if you enter chanArray as a cell array then this 'plotype' option will be ignored.
% clrbar =0; % 0 = colorbar off, 1 = on
% fontsize = 16;
% fontname = 'Arial';
% % x_axis_width = .6;
% % y_axis_height = .8;
% electrode_title = 0;

plotTFA(TFA, datatype, binArray, chanArray, amprange, twindow, fwindow, blcwin, blctype,fshading,fcontour,Ylog,plotype);

%%
%topo plots of alpha -> do tfa2erp for baselined total power for alpha
%range (8-12.5hz)
subjs = {
    'ECR_08_0001'
    'ECR_08_0002'
    'ECR_08_0003'
    'ECR_08_0004'
    'ECR_08_0005'
    'ECR_08_0006'
    'ECR_08_0008'
    'ECR_08_0009'
    'ECR_08_0010'
    'ECR_08_0011'
    'ECR_08_0013'
    'ECR_08_0014'
    'ECR_08_0015'
    'ECR_00_0006'
    'ECR_00_0008'
    'ECR_00_0009'
    'ECR_00_0011'
    'ECR_00_0012'
    'ECR_00_0013'
    'ECR_00_0014'
    'ECR_00_0015'
    'ECR_03_0002'
    'ECR_03_0003'
    'ECR_03_0004'
    'ECR_03_0005'
    'ECR_03_0006'
    'ECR_03_0007'
    'ECR_03_0008'
    'ECR_03_0009'
    'ECR_04_0003'
    'ECR_04_0005'
    'ECR_04_0008'
    'ECR_04_0009'
    'ECR_04_0010'
    'ECR_04_0011'
    'ECR_04_0012'
    'ECR_04_0014'
    'ECR_04_0015'
    'ECR_04_0016'
    'ECR_04_0017'
    'ECR_04_0018'
    'ECR_04_0019'
    'ECR_04_0022'
    'ECR_04_0026'
    'ECR_04_0027'
    'ECR_04_0029'}

trial_type = '40-500ms'

for s=1:length(subjs)
    clear TFA TFA6 ERP ERP_6
    
subject = ['ECR-' subjs{s}(5:6) '-' subjs{s}(8:11)]

    pathname_read  = [pathname_source '\TFA_3cycle']; %[pathname_source '\TFA_6cycle'];
    pathname_read_6 = [pathname_source '\TFA_6cycle'];
    tfa_filename = sprintf('ASSR_%s_%s_Average_REF_TFA_-500_BL_TPower_3cycle.tfa', subject, trial_type)
    tfa_filename_6 = sprintf('ASSR_%s_%s_Average_REF_TFA_-500_BL_TPower_6cycle.tfa', subject, trial_type)

    TFA = loadTFA('filename',tfa_filename,'filepath',pathname_read); %load TFA file to plot
    TFA6 = loadTFA('filename',tfa_filename_6,'filepath',pathname_read_6); %load TFA file to plot
    
    ERP = tfa2erp(TFA, [8 12.5], 0)
    ERP_6 = tfa2erp(TFA6, [8 12.5], 0)
    
    erpname = sprintf('ASSR_%s_%s_Average_REF_TFA_-500_BL_TPower_3cycle_PseudoERP_alpha_8-12.5Hz', subject, trial_type)
    erpname_6 = sprintf('ASSR_%s_%s_Average_REF_TFA_-500_BL_TPower_6cycle_PseudoERP_alpha_8-12.5Hz', subject, trial_type)

    pathname_write = [pathname_source '\TFA_3cycle\PseudoERPs\Alpha_8to12.5Hz\']
    pathname_write_6 = [pathname_source '\TFA_6cycle\PseudoERPs\Alpha_8to12.5Hz\']
    
    if exist(pathname_write, 'dir')==0
        mkdir(pathname_write);
    end
    
    if exist(pathname_write_6, 'dir')==0
        mkdir(pathname_write_6);
    end
    
    ERP  = pop_savemyerp(ERP, 'erpname', erpname, 'filename', [erpname '.erp'], 'filepath', pathname_write);
    ERP_6  = pop_savemyerp(ERP_6, 'erpname', erpname_6, 'filename', [erpname_6 '.erp'], 'filepath', pathname_write_6);
end


for s=1:length(subjs)
    clear TFA TFA6 ERP ERP_6
    
subject = ['ECR-' subjs{s}(5:6) '-' subjs{s}(8:11)]

    pathname_read  = [pathname_source '\TFA_3cycle']; %[pathname_source '\TFA_6cycle'];
    pathname_read_6 = [pathname_source '\TFA_6cycle'];
    tfa_filename = sprintf('ASSR_%s_%s_Average_REF_TFA_-500_BL_TPower_3cycle.tfa', subject, trial_type)
    tfa_filename_6 = sprintf('ASSR_%s_%s_Average_REF_TFA_-500_BL_TPower_6cycle.tfa', subject, trial_type)

    TFA = loadTFA('filename',tfa_filename,'filepath',pathname_read); %load TFA file to plot
    TFA6 = loadTFA('filename',tfa_filename_6,'filepath',pathname_read_6); %load TFA file to plot
    
    ERP = tfa2erp(TFA, [25 60], 0)
    ERP_6 = tfa2erp(TFA6, [25 60], 0)
    
    erpname = sprintf('ASSR_%s_%s_Average_REF_TFA_-500_BL_TPower_3cycle_PseudoERP_Gamma_25-60Hz', subject, trial_type)
    erpname_6 = sprintf('ASSR_%s_%s_Average_REF_TFA_-500_BL_TPower_6cycle_PseudoERP_Gamma_25-60Hz', subject, trial_type)

    pathname_write = [pathname_source '\TFA_3cycle\PseudoERPs\Gamma_25-60Hz\']
    pathname_write_6 = [pathname_source '\TFA_6cycle\PseudoERPs\Gamma_25-60Hz\']
    
    if exist(pathname_write, 'dir')==0
        mkdir(pathname_write);
    end
    
    if exist(pathname_write_6, 'dir')==0
        mkdir(pathname_write_6);
    end
    
    ERP  = pop_savemyerp(ERP, 'erpname', erpname, 'filename', [erpname '.erp'], 'filepath', pathname_write);
    ERP_6  = pop_savemyerp(ERP_6, 'erpname', erpname_6, 'filename', [erpname_6 '.erp'], 'filepath', pathname_write_6);
end