function gaussian_SCT = gaussian_measure(Fs)
% Apply SCT measure to gaussian noise that serves as reference

LCF_single_window_size = round(Parameters.LCF_SINGLE_WINDOW_LENGTH*Fs);
signal_length = Parameters.SCT_WINDOW_LENGTH;

% This yields a value converged to two significant digits quite quickly, 
% sufficient for our purpose. Could compute this offline for a given sample 
% rate to arbitrary accuracy.
num_trials = 100;

gaussian_SCT = 0;
for i = 1:num_trials
    noise_sig = randn(round(Fs*signal_length),1);
    noise_sig = noise_sig/max(abs(noise_sig));
    [norm_echogram_ref, ~] = NormEchogram(noise_sig, LCF_single_window_size, Fs);
    [sct, ~] = SCT(norm_echogram_ref, Fs);
    gaussian_SCT = gaussian_SCT + sct;
end
gaussian_SCT = gaussian_SCT / num_trials;
end