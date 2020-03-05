% this script has to illustrate the functionalities of the pipeline we use
% in our code
addpath(Parameters.SPARSE_MEASURES)

figure('name', 'Shoebox experiment', 'units', 'normalized','outerposition',[0 0 1 1])

signal_length = 1;
load(Parameters.SIMULATION_SHOEBOX_VOLUME_4)       
Fs = 1/Timestep;
signal_index = 1;
IR1 = ResponseSignals(signal_index, :);
[signal_1, signal_with_direct_1, ~] = remove_direct_sound(IR1, Fs, signal_length);

LCF_single_window_size = round(Parameters.LCF_SINGLE_WINDOW_LENGTH*Fs);
SCT_window_size = round(Parameters.SCT_WINDOW_LENGTH*Fs);
%% subfigure 1: the transition from input signal to echogram with enhanced
% peaks
subplot(2, 3, 1)
plot((1:length(signal_1))/Fs, signal_1, 'k')
xlim([0, signal_length])
set(gca, 'ytick', [])
title('Impulse response', 'fontsize', 12)

subplot(2, 3, 2)
plot((1:length(signal_1))/Fs, signal_1.^2, 'k')
xlim([0, signal_length])
set(gca, 'ytick', [])
title('Echogram', 'fontsize', 12)

subplot(2, 3, 3)
[normalized_echogram, ~] = NormEchogram(signal_1, LCF_single_window_size, Fs);
plot((1:length(normalized_echogram))/Fs, normalized_echogram, 'k')
xlim([0, signal_length])
set(gca, 'ytick', [])
title('Normalized echogram', 'fontsize', 12)

%% subfigure 2: from echogram with enhanced peaks to echo density profile
subplot(2, 3, 4)
hold on
norm_echogram_segment = normalized_echogram(round(length(normalized_echogram)/5): ...
    round(2*(length(normalized_echogram)/5)-1));
plot([0.3 0.3], [0 max(normalized_echogram)], 'r', 'LineWidth', 3)
area([0.2 0.4], [20 20],'FaceColor','k','FaceAlpha',.2,'EdgeAlpha', 0)
plot((1:length(normalized_echogram))/Fs, normalized_echogram, 'k')
xlim([0, signal_length])
title('Normalized echogram', 'fontsize', 12)
legend('Analysis window center sample')
box on
set(gca, 'ytick', [])

subplot(2, 3, 5)
hold on
[sct, signal_sorted] = SCT(norm_echogram_segment, Fs);
plot((1:length(norm_echogram_segment))/length(norm_echogram_segment), sort(norm_echogram_segment, 'descend'), 'k');
p_sct = plot([sct, sct]/100, [0, signal_sorted(round(sct/100*length(signal_sorted)))], 'b', 'LineWidth', 3);
box on
set(gca, 'ytick', [])
title('Sorted normalized echogram', 'fontsize', 12)
xlabel('fraction of samples');
legend(p_sct,'Sorted Center Time for analysis window');

subplot(2, 3, 6)
echo_density_reference = gaussian_measure(Fs);
sct = sct/echo_density_reference;
echo_density_1 = EDP_SCT(normalized_echogram, SCT_window_size, Fs);
echo_density_1 = echo_density_1/echo_density_reference;
plot((1:length(echo_density_1))/Fs, ones(length(echo_density_1), 1), 'k')
hold on
plot([0.3 0.3], [0, sct], 'r', 'LineWidth', 3)
plot([0 0.3], [sct, sct], 'b', 'LineWidth', 3)
plot((1:length(echo_density_1))/Fs, echo_density_1, 'k', 'LineWidth', 2)
title('Echo density', 'fontsize', 12)
legend('Gaussian noise')
ylim([0.5 1.2]);

for i = [1, 2, 3, 4, 6]
    subplot(2, 3, i)
    xlabel('time [s]', 'FontSize', 9)
end
for i = 1:6
    subplot(2, 3, i)
    set(gca, 'fontsize', 9) 
end