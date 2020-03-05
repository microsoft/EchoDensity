function [ret_SCT, sorted_echogram] = SCT(echogram, Fs)
% SCT - Sorted Center Time
% Input is normalized echogram and its sampling rate.

N = length(echogram);
t = (1:N)/Fs;
t = reshape(t, size(echogram));

sorted_echogram = sort(echogram, 'descend');

center_time = sum(t.*sorted_echogram) / sum(sorted_echogram);
duration = t(end);

ret_SCT = center_time/duration*100;
end