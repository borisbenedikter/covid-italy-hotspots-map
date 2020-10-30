%% Initialization

clc; clear; close all;

format long g

%% Data

% Paths
data_dir = '../data-pcm-dpc/';
data_dir_reg = join([data_dir, 'dati-regioni/']);
file_root_reg = 'dpc-covid19-ita-regioni-';

% Region names
reg_names = get_region_names();
n_regs = size(reg_names, 1);     % Number of regions

% Date
% first_day_back = datetime('01-10-2020', 'InputFormat', 'dd-MM-yyyy');
first_day_back = datetime('30-10-2020', 'InputFormat', 'dd-MM-yyyy');
last_day_back = datetime('30-10-2020', 'InputFormat', 'dd-MM-yyyy');
n_days_back = days(last_day_back - first_day_back);
for days_back = 0:n_days_back

% Cases in intensive care units (ICUs)
icu_cases_reg = zeros(n_regs, 1);

% Day
day = last_day_back - (n_days_back - days_back);
yyyy = day.Year;
mm = day.Month;
dd = day.Day;
day_str = join([num2str(yyyy), sprintf('%02d', mm), sprintf('%02d', dd)]);

% Regions file
file_reg = join([data_dir_reg, file_root_reg, day_str, '.csv']);
data_reg = csvimport(file_reg);
n_rows = size(data_reg, 1);
for i = 2:n_rows
    ID_reg = data_reg{i, 3};
    icu = data_reg{i, 8};
    if ischar(ID_reg)
        ID_reg = str2num(ID_reg);
    end
    if ischar(icu)
        icu = str2num(icu);
    end
    icu_cases_reg(ID_reg, 1) = icu;
end

% How many ICUs are being used (wrt the total)?
icu_cases_reg_frac = icu_cases_reg;
for ID_reg = 1:n_regs
    icu_max = get_region_icu_max(ID_reg);
    icu_cases_reg_frac(ID_reg) = icu_cases_reg_frac(ID_reg) .* (100 / icu_max);
end
[icu_cases_reg_frac_sort, ind_reg_frac_sort] = ...
    sort(icu_cases_reg_frac, 'descend');

% ICUs per 100k people
icu_cases_reg_100k = icu_cases_reg;
for ID_reg = 1:n_regs
    pop = get_region_pop(ID_reg);
    icu_cases_reg_100k(ID_reg) = icu_cases_reg_100k(ID_reg) .* (100e3 / pop);
end

%% Print report
day

fprintf('%6s%-20s%6s%10s%20s\n', '# ', 'Regione', 'ICU', 'x100k', 'ICU/Totali (%)');
for i = 1:n_regs
    fprintf('%6s%-20s%6d%10.2f%20.2f\n', ...
        sprintf('%4d. ', i), ...
        reg_names{ind_reg_frac_sort(i)}, ...
        icu_cases_reg(ind_reg_frac_sort(i)), ...
        icu_cases_reg_100k(ind_reg_frac_sort(i)), ...
        icu_cases_reg_frac(ind_reg_frac_sort(i)));
end

%% MAP

% Colormap intervals
n_levels = 5;
low_level = 0.;
upp_level = 50.;

% Load map data
map_folder = '../geo/';
load(join([map_folder, 'regions_and_provinces_map.mat']));

position_left = [1, 31, 575, 556];
% position_left = [1.768, 41.7808, 766.464, 740.7936];
% position_left = [0.0005, 0.0472, 0.4990, 0.8574];
f_reg = figure('units', 'points', 'Position', position_left);
cmap = colormap(flip(hot(n_levels + 2), 1));

for k = 1:n_regs
    level = determine_level(icu_cases_reg_frac(k), ...
        n_levels, low_level, upp_level);
    mapshow(regions{k}, 'FaceColor', cmap(level, :));
    if k == 1
        hold on;
    end
end
date_format = 'mmmm dd, yyyy';
set(get(gca, 'Title'), 'String', join(['\bf ', datestr(day, date_format)]), ...
    'Interpreter', 'Latex', 'FontSize', 14);
cb = colorbar(gca);

step_level = (upp_level - low_level) / n_levels;
low_color_level = low_level - step_level;
upp_color_level = upp_level + step_level;
caxis([low_color_level, upp_color_level]);
% set(cb, 'Limits', [low_color_level, low_color_level]);
set(cb, 'Ticks', low_level:step_level:upp_level);
set(cb, 'TickLabelInterpreter', 'latex');
set(cb, 'FontSize', 11);
set(cb, 'Location', 'South');
cb.Label.Interpreter = 'Latex';
cb.Label.String = 'Intensive care unit occupancy rate due to COVID-19 (\%)';
cb.Label.FontSize = 11;
set(cb, 'AxisLocation', 'out');

axis off

fig_dir = '../figs/icu/';
if verLessThan('matlab', '9.8')
    saveas(f_reg, join([fig_dir, 'icu-', day_str, '.png']));
else
    exportgraphics(gca, join([fig_dir, 'icu-', day_str, '.png']), ...
        'Resolution', 300);
end

if days_back < n_days_back
    close(f_reg);
end

end

fclose('all');

