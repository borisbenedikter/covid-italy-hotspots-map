%% Initialization

clc; clear; close all;

format long g

%% Data

% Paths
data_dir = '../data-pcm-dpc/';
data_dir_reg = join([data_dir, 'dati-regioni/']);
file_root_reg = 'dpc-covid19-ita-regioni-';
data_dir_prov = join([data_dir, 'dati-province/']);
file_root_prov = 'dpc-covid19-ita-province-';

% Avg over last X days
n_days = 7;

% Region names
reg_names = get_region_names();
n_regs = size(reg_names, 1);     % Number of regions
prov_names = get_province_names();
n_provs = size(prov_names, 1);     % Number of provinces

% Get date

% first_day_back = datetime('01-07-2020', 'InputFormat', 'dd-MM-yyyy');
first_day_back = datetime('02-11-2020', 'InputFormat', 'dd-MM-yyyy');
last_day_back = datetime('02-11-2020', 'InputFormat', 'dd-MM-yyyy');
n_days_back = days(last_day_back - first_day_back);
for days_back = 0:n_days_back

today = last_day_back - (n_days_back - days_back);

new_cases_reg = zeros(n_days, n_regs);
new_cases_prov = zeros(n_days, n_provs);
tot_cases_start_prov = get_province_tot_cases(today - n_days);

for j = 1:n_days
    % Day
    day = today - (n_days - j);
    yyyy = day.Year;
    mm = day.Month;
    dd = day.Day;
    day_str = join([num2str(yyyy), sprintf('%02d', mm), sprintf('%02d', dd)]);

    % Regions file
    file_reg = join([data_dir_reg, file_root_reg, day_str, '.csv']);
    data_reg = csvimport(file_reg);
    n_rows = size(data_reg, 1);
    for i = 2:n_rows
        i_reg = data_reg{i, 3};
        new = data_reg{i, 13};
        if ischar(i_reg)
            i_reg = str2num(i_reg);
        end
        if ischar(new)
            new = str2num(new);
        end
        new_cases_reg(j, i_reg) = new_cases_reg(j, i_reg) + new;
    end

    % Provinces file
    if j == n_days
        file_prov = join([data_dir_prov, file_root_prov, day_str, '.csv']);
        data_prov = csvimport(file_prov);
        n_rows = size(data_prov, 1);
        for i = 2:n_rows
            i_prov = data_prov{i, 5};
            if ischar(i_prov)
                i_prov = str2num(i_prov);
            end
            if i_prov > n_provs % Skip Fuori provincia
                continue;
            end
            new_tot = data_prov{i, 10};
            if ischar(new_tot)
                new_tot = str2num(new_tot);
            end
            new = new_tot - tot_cases_start_prov(i_prov);
            new_cases_prov(j, i_prov) = new_cases_prov(j, i_prov) + new;
            tot_cases_start_prov(i_prov) = new_tot;
        end
    end
end

new_cases_reg_avg = zeros(n_regs, 1);
for i = 1:n_regs
    for j = 1:n_days
        new_cases_reg_avg(i) = new_cases_reg_avg(i) + new_cases_reg(j, i);
    end
    new_cases_reg_avg(i) = new_cases_reg_avg(i) / n_days;
end

new_cases_reg_avg_100k = new_cases_reg_avg;
for i = 1:n_regs
    pop = get_region_pop(i);
    new_cases_reg_avg_100k(i) = new_cases_reg_avg_100k(i) .* (100e3 / pop);
end
[new_cases_reg_avg_100k_sort, ind_reg_sort] = ...
    sort(new_cases_reg_avg_100k, 'descend');

new_cases_prov_avg = zeros(n_provs, 1);
for i = 1:n_provs
    for j = 1:n_days
        new_cases_prov_avg(i) = new_cases_prov_avg(i) + new_cases_prov(j, i);
    end
    new_cases_prov_avg(i) = new_cases_prov_avg(i) / n_days;
end

new_cases_prov_avg_100k = new_cases_prov_avg;
for i = 1:n_provs
    pop = get_province_pop(i);
    new_cases_prov_avg_100k(i) = new_cases_prov_avg_100k(i) .* (100e3 / pop);
end
[new_cases_prov_avg_100k_sort, ind_prov_sort] = ...
    sort(new_cases_prov_avg_100k, 'descend');

%% Print report
today

fprintf('%6s%-20s%20s%10s\n', '# ', 'Regione', 'Media nuovi casi', 'x100000');
for i = 1:n_regs
    fprintf('%6s%-20s%20.2f%10.2f\n', ...
        sprintf('%4d. ', i), ...
        reg_names{ind_reg_sort(i)}, ...
        new_cases_reg_avg(ind_reg_sort(i)), ...
        new_cases_reg_avg_100k(ind_reg_sort(i)));
end
fprintf('\n');
fprintf('\n');
fprintf('%6s%-25s%20s%10s\n', '# ', 'Provincia', 'Media nuovi casi', 'x100000');
for i = 1:n_provs
    fprintf('%6s%-25s%20.2f%10.2f\n', ...
        sprintf('%4d. ', i), ...
        prov_names{ind_prov_sort(i)}, ...
        new_cases_prov_avg(ind_prov_sort(i)), ...
        new_cases_prov_avg_100k(ind_prov_sort(i)));
end

% %% Print csv
% file_out = 'report.csv';
% fileID = fopen(file_out, 'w');

% fprintf(fileID, '%s,%s,%s,\n', 'Regione', 'Media nuovi casi', 'x100000');
% for i = 1:n_regs
%     fprintf(fileID, '%s,%.2f,%.2f,\n', ...
%         reg_names{i}, new_cases_reg_avg(i), new_cases_reg_avg_100k(i));
% end

%% MAP

% Colormap intervals
n_levels = 6;
low_level = 0.;
% upp_level = 12.;
% upp_level = 24.;
upp_level = 54.;

% Load map data
map_folder = '../geo/';
load(join([map_folder, 'regions_and_provinces_map.mat']));

position_left = [1, 31, 575, 556];
% position_left = [1.768, 41.7808, 766.464, 740.7936];
% position_left = [0.0005, 0.0472, 0.4990, 0.8574];
f_reg = figure('units', 'points', 'Position', position_left);
cmap = colormap(flip(hot(n_levels + 2), 1));

% f_reg = figure('units', 'normalized', 'Position', [0 0 1 1]);
% subplot(1, 2, 1)
% for k = 1:n_regs
%     color = determine_color(new_cases_reg_avg_100k(k));
%     mapshow(regions{k}, 'FaceColor', color);
%     if k == 1
%         hold on;
%     end
% end
% set(get(gca, 'Title'), 'String', 'Region Map');

% f_prov = figure('units', 'normalized', 'Position', [0 0 1 1]);
% subplot(1, 2, 2)
for k = 1:n_provs
    level = determine_level(new_cases_prov_avg_100k(k), ...
        n_levels, low_level, upp_level);
    mapshow(provinces{k}, 'FaceColor', cmap(level, :));
    if k == 1
        hold on;
    end
end
date_format = 'mmmm dd, yyyy';
set(get(gca, 'Title'), 'String', join(['\bf ', datestr(today, date_format)]), ...
    'Interpreter', 'Latex', 'FontSize', 14);
% set(get(gca, 'Title'), 'String', 'Province-Colored Map', ...
    % 'Interpreter', 'Latex');
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
cb.Label.String = 'Average daily cases per 100,000 people in the last week';
cb.Label.Interpreter = 'Latex';
cb.Label.FontSize = 11;
set(cb, 'AxisLocation', 'out');

ymin = 3900000;
ymax = 5220000;
axis([-inf, +inf, ymin, ymax]);

axis off

% fig_dir = '../figs/scale-0-24/';
% fig_dir = '../figs/scale-0-56/';
fig_dir = join(['../figs/scale-0-', num2str(round(upp_level)) ,'/']);
if verLessThan('matlab', '9.8')
    saveas(f_reg, join([fig_dir, 'hotspots-', day_str, '.png']));
else
    exportgraphics(gca, join([fig_dir, 'hotspots-', day_str, '.png']), ...
        'Resolution', 300);
end

if days_back < n_days_back
    close(f_reg);
end

end

fclose('all');

