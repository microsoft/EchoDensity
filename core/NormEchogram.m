function [normalized_echogram, sorted_center_time] = NormEchogram(signal, window_size, Fs)

N = length(signal);
signal = reshape(signal, [N, 1]);
half_window = round(window_size/2);

normalized_echogram = zeros(1,N);

for i = 1:length(signal)  
    % we will be using the Tukey window for peak enhancement
    r = 0.5;
    w = tukeywin(window_size, r);  % r = 0 == rectwin and r = 1 == hann
    il = max(1, (i - half_window + 1));
    ir = min(length(signal), (i + (window_size - half_window)));
    signal_segment = signal(il:ir);
    if (length(signal_segment) ~= length(w))
        if(ir < length(signal)/2)
            w = w(max((length(w) - length(signal_segment) + 1), 1):length(w));
        else
            w = w(1:length(signal_segment));
        end
    end
    w = w/sum(w);
    signal_segment = signal_segment.^2;
    local_energy = sum(signal_segment.*w);
    
    normalized_echogram(i) = signal(i).^2 / local_energy;
end

sorted_center_time = SCT(normalized_echogram, Fs);
end