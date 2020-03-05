function [a, n] = curve_fitting(data_points_in, Fs, col, figure_title)
% we want to fit the whole echo density profile to a parameteric model
% our parametric model consists out of alpha*t^n segment and a constant
% segment
% the transition between the segments is modeled with a sigmoid function
% that smoothly blends between two behaviors

%% Data preprocessing (removing E0)
[~, index] = min(data_points_in(1:round(Fs/5)));
data_points_chopped = data_points_in(index:end);
E0 = data_points_chopped(1);
data_points = max(data_points_chopped - E0, 0) + 0.0001;
t = (index + (1:length(data_points)))/Fs; 
t_bias = 0.02;
% look up 'milliseconds_to_remove' in remove_direct_sound

sigma = Parameters.SIGMA;
fun_w = @(t, sigma, t_cut_off) (0.5*(1 - tanh((t - t_cut_off)/sigma)));
fun_tmix = @(loga, n, e_inf) (power((e_inf)/exp(loga), 1/n));
fun = @(an, logt) (fun_w(exp(logt),sigma,fun_tmix(an(1),an(2),an(3))) .* (an(2)*logt + an(1)) + ...
    (1 - fun_w(exp(logt),sigma,fun_tmix(an(1),an(2),an(3)))) .* log(an(3)));
options = optimset('MaxFunEvals', 2000);
[an] = lsqcurvefit(fun, [1 2 0.9], log(t_bias + t), log(data_points), [-inf, 0, 0], [inf, 5, 2], options);
loga = an(1);
n = an(2);
e_inf = an(3);
t_mix = fun_tmix(an(1),an(2),an(3));

hold on
p1 = plot(t + t_bias, exp(fun(an,log(t_bias + t)))+ E0, 'k', 'LineWidth', 3);
p1.Color(4) = 0.25;
plot(t + t_bias, data_points + E0, 'color', col, 'LineWidth', 2)

hold off
grid on
text(0.25, 0.6, figure_title, 'FontSize', 12, 'color', [0.5 0.5 0.5], 'fontweight', 'bold')
title(sprintf('n = %.2f, t_{mix} = %.2f', n, t_mix), 'Fontsize', 12)
xlim([0 1])
a = exp(loga); % for extracting the volume
end