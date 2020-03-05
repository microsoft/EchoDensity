function echo_density = EDP_SCT(signal, SCT_window_size, Fs)
% Applies the Sorted Center Time measure along a sliding window 
% to compute an echo density profile
N = length(signal);
signal = reshape(signal, [N, 1]);
half_window = round(SCT_window_size/2);
echo_density = zeros(1,N);
for i = 1:length(signal)
    il = max(1, (i - half_window + 1));
    ir = min(length(signal), (i + (SCT_window_size - half_window)));
    [sct, ~] = SCT(signal(il:ir), Fs);
    echo_density(i) = sct;
end
end