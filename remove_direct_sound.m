function [clean_signal, signal_with_direct, rir_cut] = remove_direct_sound(signal, Fs, signal_length)
% we need to prepare an appropriate signal for applying the measure
signal = reshape(signal, [1, length(signal)]);
milliseconds_to_remove = Parameters.MILLISECONDS_TO_REMOVE/1000;
one_side_window = round(milliseconds_to_remove*Fs); 
direct_index = find(signal > max(signal)*0.25, 1);
signal_with_direct = signal(1, max((direct_index - one_side_window), 1):end); % with direct path
%dB_value = 40; % EXPLORE
%RT30 = get_rt(signal, dB_value);                                 % can be added if needed
clean_signal = signal_with_direct(1, (2*one_side_window):end);                % without direct path
clean_signal = clean_signal(1, 1:round(min(Fs*signal_length, length(clean_signal))));%RT30);
%clean_signal = clean_signal(1, 1:RT30);
rir_cut = direct_index + one_side_window;
end