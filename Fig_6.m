addpath(Parameters.SPARSE_MEASURES)

figure('name', 'SIMULATIONS - sliding lid - big shoebox', 'units', 'normalized','outerposition',[0 0 1 1])

subplot(3, 4, 1)
image(imread(Parameters.MODEL_SHOEBOX_CLOSED))
set(gca,'xtick',[])
set(gca,'ytick',[])
title('Closed', 'FontSize', 12)

subplot(3, 4, 2)
image(imread(Parameters.MODEL_SHOEBOX_ALMOST_CLOSED))
set(gca,'xtick',[])
set(gca,'ytick',[])
title('Almost closed', 'FontSize', 12)

subplot(3, 4, 3)
image(imread(Parameters.MODEL_SHOEBOX_ALMOST_OPEN))
set(gca,'xtick',[])
set(gca,'ytick',[])
title('Almost open', 'FontSize', 12)

subplot(3, 4, 4)
image(imread(Parameters.MODEL_SHOEBOX_OPEN))
set(gca,'xtick',[])
set(gca,'ytick',[])
title('Open', 'FontSize', 12)

%% PART 1
signal_duration = 1;
signal_index = 1;
load(Parameters.SIMULATION_SHOEBOX_CLOSED)
Fs = 1/Timestep;
IR1 = ResponseSignals(signal_index, :);
load(Parameters.SIMULATION_SHOEBOX_ALMOST_OPEN)
IR2 = ResponseSignals(signal_index, :);
load(Parameters.SIMULATION_SHOEBOX_ALMOST_CLOSED)
IR3 = ResponseSignals(signal_index, :);
load(Parameters.SIMULATION_SHOEBOX_OPEN)
IR4 = ResponseSignals(signal_index, :);
[signal_1, signal_with_direct_1, ~] = remove_direct_sound(IR1, Fs, signal_duration);
[signal_2, signal_with_direct_2, ~] = remove_direct_sound(IR2, Fs, signal_duration);
[signal_3, signal_with_direct_3, ~] = remove_direct_sound(IR3, Fs, signal_duration);
[signal_4, signal_with_direct_4, ~] = remove_direct_sound(IR4, Fs, signal_duration);
subplot(3, 4, [5, 6])
hold on
plot((1:length(signal_1))/Fs, signal_1, 'k')
plot((1:length(signal_2))/Fs, signal_2, 'r')
plot((1:length(signal_3))/Fs, signal_3, 'b')
plot((1:length(signal_4))/Fs, signal_4, 'color', [0,100/256,0])
xlim([0, signal_duration])
grid on
set(gca, 'ytick', [])
title('Impulse responses', 'FontSize', 12)
legend({'Closed', 'Almost closed', 'Almost open', 'Open'}, 'FontSize', 9)
box on
LCF_single_window_size = round(Parameters.LCF_SINGLE_WINDOW_LENGTH*Fs);
SCT_window_size = round(Parameters.SCT_WINDOW_LENGTH*Fs);
EDP_window_size = round(Parameters.EDP_WINDOW_LENGTH*Fs);
%%
echo_density_reference = gaussian_measure(Fs);
[norm_echogram_1, ~] = NormEchogram(signal_1, LCF_single_window_size, Fs);
[norm_echogram_2, ~] = NormEchogram(signal_2, LCF_single_window_size, Fs);
[norm_echogram_3, ~] = NormEchogram(signal_3, LCF_single_window_size, Fs);
[norm_echogram_4, ~] = NormEchogram(signal_4, LCF_single_window_size, Fs);
echo_density_1 = EDP_SCT(norm_echogram_1, SCT_window_size, Fs);
echo_density_2 = EDP_SCT(norm_echogram_2, SCT_window_size, Fs);
echo_density_3 = EDP_SCT(norm_echogram_3, SCT_window_size, Fs);
echo_density_4 = EDP_SCT(norm_echogram_4, SCT_window_size, Fs);

echo_density_1 = echo_density_1/echo_density_reference;
echo_density_2 = echo_density_2/echo_density_reference;
echo_density_3 = echo_density_3/echo_density_reference;
echo_density_4 = echo_density_4/echo_density_reference;

subplot(3, 4, [9, 10])
hold on

plot((1:length(echo_density_1))/Fs, echo_density_1, 'k')
plot((1:length(echo_density_2))/Fs, echo_density_2, 'r')
plot((1:length(echo_density_3))/Fs, echo_density_3, 'b')
plot((1:length(echo_density_4))/Fs, echo_density_4, 'color', [0,100/256,0])
plot((1:length(echo_density_1))/Fs, ones(length(echo_density_1), 1), 'k')
xlim([0, signal_duration])
ylim([0.4, Inf])
grid on
title('Echo density', 'FontSize', 12)
legend({'Closed', 'Almost closed', 'Almost open', 'Open'}, 'Location', 'southeast', 'FontSize', 9)
box on
%% PART 2
% Here we explore the behavior of 4 room volumes
addpath(Parameters.SPARSE_MEASURES)
data = {Parameters.SIMULATION_SHOEBOX_CLOSED; ...
    Parameters.SIMULATION_SHOEBOX_ALMOST_OPEN; ... % fbx files were mixed
    Parameters.SIMULATION_SHOEBOX_ALMOST_CLOSED; ...
    Parameters.SIMULATION_SHOEBOX_OPEN};
figure_number = [7, 8, 11, 12];

echo_density_reference = gaussian_measure(Fs);

for i = 1:length(data)
    load(data{i})
    Fs = 1/Timestep;
    signal_index = 1;
    IR = ResponseSignals(signal_index, :);
    
    signal_duration = 1;
    [signal, ~, ~] = remove_direct_sound(IR, Fs, signal_duration);
    
    LCF_single_window_size = round(Parameters.TUCKEY_WINDOW_LENGTH*Fs);
    SCT_window_size = round(Parameters.SCT_WINDOW_LENGTH*Fs);
    [norm_echogram, ~] = NormEchogram(signal, LCF_single_window_size, Fs);
    echo_density = EDP_SCT(norm_echogram, SCT_window_size, Fs);
    echo_density = echo_density/echo_density_reference;
    first_one = find(echo_density > 1, 1);
    subplot(3, 4, figure_number(i))
    if (i == 1)
        figure_title = 'Closed';
        col = 'k';
    elseif (i == 2)
        figure_title = 'Almost closed';
        col = 'r';
    elseif (i == 3)
        figure_title = 'Almost open';
        col = 'b';
    else
        figure_title = 'Open';
        col = [0,100/256,0];
    end
    
    [a, n] = curve_fitting(echo_density, Fs, col, figure_title);
    
    xlim([0 0.6])
    ylim([0.4 1.2])
    box on
end
