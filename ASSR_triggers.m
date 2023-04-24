function [EEG] = ASSR_triggers(EEG)

for a=1:length(EEG.event)
    if strcmp(EEG.event(a).type, 'S  4')
        EEG.event(a).type = '4';
        EEG.urevent(a).type = '4';
    elseif strcmp(EEG.event(a).type, 'S  5')
        EEG.event(a).type = '5';
        EEG.urevent(a).type = '5';
    elseif strcmp(EEG.event(a).type, 'S  8')
        EEG.event(a).type = '8';
        EEG.urevent(a).type = '8';
    elseif strcmp(EEG.event(a).type, 'S 12')
        EEG.event(a).type = '12';
        EEG.urevent(a).type = '12';
    elseif strcmp(EEG.event(a).type, 'S 40')
        EEG.event(a).type = '40';
        EEG.urevent(a).type = '40';
    elseif strcmp(EEG.event(a).type, 'S 80')
        EEG.event(a).type = '80';
        EEG.urevent(a).type = '80';
    elseif strcmp(EEG.event(a).type, 'S100')
        EEG.event(a).type = '100';
        EEG.urevent(a).type = '100';
    elseif strcmp(EEG.event(a).type, 'S101')
        EEG.event(a).type = '101';
        EEG.urevent(a).type = '101';
    elseif strcmp(EEG.event(a).type, 'S128')
        EEG.event(a).type = '128';
        EEG.urevent(a).type = '128';
    elseif strcmp(EEG.event(a).type, 'S200')
        EEG.event(a).type = '200';
        EEG.urevent(a).type = '200';
    end
end
