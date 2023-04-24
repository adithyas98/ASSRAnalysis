clear all
close all
pack
clc

addpath('C:\Users\ams2590\Documents\MATLAB\eeglab2021.1')
addpath('C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts');
addpath('H:\TMS ASSR Analysis\Scripts');
scripts = 'H:\TMS ASSR Analysis\Scripts';
addpath('C:\Users\ams2590\Documents\MATLAB\ColumbiaScripts\functions');
eeglab

pathname_source = 'H:\TMS ASSR Analysis\processed_data';


groups = {'AHRS_mean_geq_3','AHRS_mean_lessThan_3'};
threshold = 3;
AHRSFile = readtable(['H:\TMS ASSR Analysis\TMS Data\AHRS_remote study.csv']);
AHRSFileSize = size(AHRSFile);


dataDirs = {'\ERPs.Average_REF','\All_TFA'};
badFiles = {};
for data=1:length(dataDirs)
    pathname_write = [pathname_source dataDirs{data} '\withAHRS\' ];
    if exist(pathname_write, 'dir')==0
        mkdir(pathname_write);
    end
    subjs = dir([pathname_source dataDirs{data}]);
    subjectfolderflag = ~[subjs.isdir];%We want to know if the item is a directory
    subjs = {subjs(subjectfolderflag).name};
    subjs = subjs(3:end);%we want to cut out the first two file names which are '.' and '..'
    
    for row=1:AHRSFileSize(1)
        
        ecrCode = table2array(AHRSFile(row,2));%This will get us the current ECR code
        %Now iterate through all of the files till we find a match
        for s=1:length(subjs)
            if contains(lower(subjs{s}),lower(ecrCode{1}(5:end)))
                %Then we want to rename the file so that with Hall or no
                %Hall
                AHRSScore = table2array(AHRSFile(row,4));
                Fullfilename = split(subjs{s},'.');
                filename = Fullfilename{1};
                disp('Processing File:');
                disp(filename);
                if AHRSScore >= threshold
                    copyfile([pathname_source dataDirs{data} '\' subjs{s}],[pathname_write filename '_' groups{1} '.' Fullfilename{2}])
                elseif AHRSScore < threshold
                    copyfile([pathname_source dataDirs{data} '\' subjs{s}],[pathname_write filename '_' groups{2} '.' Fullfilename{2}])
                end
            end
        end
    end
end
disp('done')
















