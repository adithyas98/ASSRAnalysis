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
groupPlots = [pathname_source '\GroupPlots'];
if exist(groupPlots, 'dir')==0
    mkdir(groupPlots);
end 
%
% Average and plot the ERP Files 
%groups = {'POST','PRE'};

groups = {'AHRS_mean_geq_3','AHRS_mean_lessThan_3'};

%get all the files in the folder

%subjs = dir([pathname_source '\ERPs.Average_REF' ]);
subjs = dir([pathname_source '\ERPs.Average_REF' '\withAHRS' ]);
subjectfolderflag = ~[subjs.isdir];%We want to know if the item is a directory
subjs = {subjs(subjectfolderflag).name};
subjs = subjs(3:end);%we want to cut out the first two file names which are '.' and '..'
badFiles = {};
for g=1:length(groups)
    grandAvgFiles = {};
    for s=1:length(subjs)
        if contains(subjs{s},'.erp') && contains(lower(subjs{s}),lower(groups{g}))
            disp(subjs{s});
            grandAvgFiles{end+1} = subjs{s};
            %While we are here we can go ahead and generate the EFFT file
            try
                [ERP ALLERP] = pop_loaderp( 'filename', subjs{s}, 'filepath', [pathname_source '\ERPs.Average_REF'  '\withAHRS' ]);
                %compute the efft
                EFFT = pop_averager( ERP , 'Compute', 'EFFT', 'Criterion', 'good', 'TaperWindow', {'hanning' [ -500 1498]} );%Some of the files were created from older versions of Matlab
            catch
                %If this doesn't work add it to a list and continue
                badFiles{end + 1} = subjs{s};
                continue;
            end
            %and save the file
            outfile = [pathname_source '\ERPs.Average_REF\withAHRS\EFFT\'];
            if exist(outfile, 'dir')==0
                mkdir(outfile);
            end            
            EFFT = pop_savemyerp(EFFT, 'erpname', [subjs{s} '_EFFT'], 'filename', [subjs{s} '_EFFT' '.erp'], 'filepath',outfile , 'Warning', 'on');% GUI: 29-Jun-2022 11:56:28
        end
    end
    %Now we can do the averaging
    try
        [ERP ALLERP] = pop_loaderp( 'filename', grandAvgFiles, 'filepath',[pathname_source '\ERPs.Average_REF'  '\withAHRS']);
    catch

        %If this doesn't work add it to a list and continue
        badFiles{end + 1} = subjs{s};
        continue;

    end
    outfolder = [pathname_source '\ERPs.Average_REF\GrandAvg'];
    if exist(outfolder, 'dir')==0
        mkdir(outfolder);
    end     
    %Compute and save the normal ERP grand average
    ERP = pop_gaverager( ALLERP , 'Erpsets', 1:length(grandAvgFiles), 'ExcludeNullBin', 'on', 'SEM', 'on' );
    ERP = pop_savemyerp(ERP, 'erpname', groups{g}, 'filename', ['ASSR_40-500ms_' groups{g} '_GrandAvg.erp'], 'filepath',outfolder , 'Warning', 'off');% GUI: 29-Jun-2022 11:56:28
    %While we are here, we can also plot
    bin = 1;
    for i = 1:4:ERP.nchan
        %For some reason we are losing 3 channels
        ERP = pop_ploterps(ERP,bin,i:i+3, 'Maximize', 'on', 'AutoYlim', 'on', 'Axsize', [ 0.05 0.08], 'BinNum', 'on', 'Blc', 'pre', 'Box', [ 3 2], 'ChLabel', 'on', 'FontSizeChan',10, 'FontSizeLeg',12, 'FontSizeTicks',10, 'LegPos', 'bottom', 'Linespec', {'k-' , 'r-' , 'b-' , 'g-' }, 'LineWidth',1, 'Maximize', 'on', 'Position', [ 103.714 28 106.857 31.9412], 'Style', 'Classic', 'Tag', 'ERP_figure', 'Transparency',0, 'xscale', [ -200 1000 -200:250:1000 ], 'YDir', 'normal' );
        title(strcat('ASSR_40-500ms_CH:',string(i),'-',string(i+3),'_' ,groups{g}),'interpreter', 'none')
        ax = gca;
        filename = strcat(groupPlots,'\','ASSR_40-500ms_CH_',string(i), '-', string(i+3), '_', groups{g},'.png');
        saveas(ax,filename)
        close all
    end
    ERP = pop_filterp( ERP,1:ERP.nchan, 'Cutoff', [35 50], 'Design', 'butter', 'Filter', 'bandpass', 'Order',2 );% GUI: 06-Jul-2022 12:42:26
    for i = 1:4:ERP.nchan
        ERP = pop_ploterps(ERP,bin,i:i+3, 'Maximize', 'on', 'AutoYlim', 'on', 'Axsize', [ 0.05 0.08], 'BinNum', 'on', 'Blc', 'pre', 'Box', [ 3 2], 'ChLabel', 'on', 'FontSizeChan',10, 'FontSizeLeg',12, 'FontSizeTicks',10, 'LegPos', 'bottom', 'Linespec', {'k-' , 'r-' , 'b-' , 'g-' }, 'LineWidth',1, 'Maximize', 'on', 'Position', [ 103.714 28 106.857 31.9412], 'Style', 'Classic', 'Tag', 'ERP_figure', 'Transparency',0, 'xscale', [ -200 1000 -200:250:1000 ], 'YDir', 'normal' );
        title(strcat('ASSR_40-500ms_CH_',string(i), '-', string(i+3), '_', groups{g},'_filtered[35,50]'),'interpreter', 'none')
        ax = gca;
        filename = strcat(groupPlots,'\','filtered[35,45]_ASSR_40-500ms_CH_',string(i),'-',string(i+3),'_' ,groups{g},'.png') ;
        saveas(ax,filename) 
        close all
    end    
    clear ERP

end
disp('Done');
close all
%%
%Move all TFA files to one folder so it is easier to manage




% %Move the contents of the 6 cycle and the 3 cycle TFAs to one folder
% sourceFolder1 = [pathname_source '\TFA_3cycle']; % replace with actual path to source folder 1
% sourceFolder2 = [pathname_source '\TFA_6cycle']; % replace with actual path to source folder 2
% destinationFolder = [pathname_source '\All_TFA']; % replace with actual path to destination folder
% 
% % create the destination folder if it does not exist
% if ~exist(destinationFolder, 'dir')
%     mkdir(destinationFolder);
% end
% 
% % copy the contents of sourceFolder1 to the destination folder
% copyfile(fullfile(sourceFolder1, '*'), destinationFolder);
% 
% % copy the contents of sourceFolder2 to the destination folder, without overwriting any existing files
% copyfile(fullfile(sourceFolder2, '*'), destinationFolder, 'f');
% 
% disp('done')

%Average and Plot TFAs

%get all the files in the folder

%subjs = dir([pathname_source '\All_TFA']);
subjs = dir([pathname_source '\All_TFA' '\withAHRS']);
subjectfolderflag = ~[subjs.isdir];%We want to know if the item is a directory
subjs = {subjs(subjectfolderflag).name};
subjs = subjs(3:end);%we want to cut out the first two file names which are '.' and '..'
badFiles = {};

%cycles = {'3cycle','6cycle','5cycle'};
cycles = {'6cycle'};
tfaTypes = {'-500_BL_Tpower','EPower','ITC','No_BL_Tpower'};
%groups = {'POST','PRE'};

outFolder = [pathname_source '\All_TFA\GrandAvg\'];
if ~exist(outFolder, 'dir')
    mkdir(outFolder);
end
%cd([pathname_source '\All_TFA']);
cd([pathname_source '\All_TFA' '\withAHRS']);
for g=1:length(groups)
    group = groups{g};
    for c=1:length(cycles)
        cycle = cycles{c};
        for t = 1:length(tfaTypes)
            tfaType = tfaTypes{t};
            grandAvgFiles = {};
            for s=1:length(subjs)
                subject = subjs{s};
                disp(subject)
                disp(strcat(tfaType,'_',cycle,'_',group))
                if contains(lower(subject),lower(tfaType)) && contains(lower(subject),lower(cycle)) && contains(lower(subject),lower(group))
                    %Then, let's add it to our list
                    grandAvgFiles{end +1} = subject;
                end
            end
            %Now we can do the averaging
            datatype = 0;
            if contains(lower(tfaType),'power')
                datatype = 0;
            elseif contains(lower(tfaType),'itc')
                datatype = 3;
            end
            TFA = GrandAveragerTFA(grandAvgFiles, datatype);%0=power; 1=phase; 2=amplitude; 3=ITC
            tfasetname = ['ASSR_40-500ms_' group '_' cycle '_' tfaType '_grandAverage']; %ITC, Baselined_TPower
            filenameTFA = fullfile(outFolder, [tfasetname '.tfa']); 
            TFA.setname  = tfasetname;
            save(filenameTFA, 'TFA');
            binsToPlot = {1};
            for b=1:length(binsToPlot)
                bin = binsToPlot{b};
                for chan=[5,14]
                    %While we are here, we can also plot
                    binArray = [bin]; % Bin indices to plot %TODO:change the
                    chanArray = [chan]; % Maximum number of channels = TFA.nchan
                    datatype = 0;
                    if contains(lower(tfaType),'tpower')
                        datatype = 0;
                    elseif contains(lower(tfaType),'epower')
                        datatype = 0;
                    elseif contains(lower(tfaType),'itc')
                        datatype = 3;
                    end
                    if datatype == 0 && ~contains(lower(tfaType),'epower')
                        %Total power
                        amprange = [-5 5]; % Amplitude range (Z-scale) (displayed as colormap) to plot.
                        if contains(cycle,'6')
                            amprange = [-2 3];
                        end
                    elseif contains(lower(tfaType),'epower')
                        %Evoked Power
                        amprange = [-0.2 0.6]; % Amplitude range (Z-scale) (displayed as colormap) to plot.
                    elseif datatype == 3
                        % ITC
                        amprange = [0 0.3]; % Amplitude range (Z-scale) (displayed as colormap) to plot.
                    else
                        amprange = [0 1];
                    end
                    twindow = [-500 1000 -500:250:1000]; % Time window where the first two numbers are the min and max and then remaining numbers designate the ticks
                    if contains(cycle,'6')
                        fwindow = [2 50    2 10 30 35 50]; % Time frequency window structured similarly to the twindow
                    elseif contains(cycle,'3')
                        fwindow = [0 26    2 4 7 12.5 26 ];
                    end
                    if datatype == 1 || datatype == 3
                        blcwin = [0 0]; % Baseline correction window
                        blctype = 'none'; % 'Divisive','none', or subtractive are the other types
                    elseif datatype == 0
                        blcwin = [-500 0]; % Baseline correction window
                        blctype = 'subtractive'; % 'Divisive','none', or subtractive are the other types
                    end
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
                    %Make our plot
                    %         subplot(2,3,i);
                    try
                        plotTFA(TFA, datatype, binArray, chanArray, amprange, twindow, fwindow, blcwin, blctype,fshading,fcontour,Ylog,plotype);
                    catch
                        badFiles{end+1} = strcat(tfaType,'_',cycle,'_',group);
                    end
                    filename = strcat('ASSR_40-500ms_CH_',TFA.chanlocs(chan).labels,'_',string(TFA.bindescr{bin}),'_',group,'_',cycle,'_',tfaType,'_TFAgrandAverage');
                    maintitle = strcat('40-500ms_CH_',TFA.chanlocs(chan).labels,'_',string(TFA.bindescr{bin}),'_',group,'_',cycle,'_',tfaType);
                    title(maintitle,'interpreter', 'none','FontSize',8)
                    %title('hello','interpreter', 'none');
                    colorbar
                    ax = gca;
                    fileloc = strcat(groupPlots,'\',filename,'.png');
                    saveas(ax,fileloc)
                    close all
                end
            end
        end
    end
end
disp('Done')
close all