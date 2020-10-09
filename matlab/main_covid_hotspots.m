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

% Avg over last 14 days
n_days = 14;

% Region names
reg_names = get_region_names();
n_regs = size(reg_names, 1);     % Number of regions
prov_names = get_province_names();
n_provs = size(prov_names, 1);     % Number of provinces

% Get date

% n_asd = 65;
% for asd = 1:n_asd

% today = datetime - (n_asd - asd + 1);
today = datetime - 1;

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

fprintf('%20s%20s%20s\n', 'Regione', 'Media nuovi casi', 'x100000');
for i = 1:n_regs
    fprintf('%20s%20.2f%20.2f\n', ...
        reg_names{ind_reg_sort(i)}, ...
        new_cases_reg_avg(ind_reg_sort(i)), ...
        new_cases_reg_avg_100k(ind_reg_sort(i)));
end
fprintf('\n');
fprintf('%25s%20s%20s\n', 'Provincia', 'Media nuovi casi', 'x100000');
for i = 1:n_provs
    fprintf('%25s%20.2f%20.2f\n', ...
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

% Load map data
map_folder = '../geo/';
load(join([map_folder, 'regions_and_provinces_map.mat']));

f_reg = figure('units', 'normalized', 'Position', [0 0 1 1]);
subplot(1, 2, 1)
for k = 1:n_regs
    color = determine_color(new_cases_reg_avg_100k(k));
    mapshow(regions{k}, 'FaceColor', color);
    if k == 1
        hold on;
    end
end
set(get(gca, 'Title'), 'String', 'Region Map');

% f_prov = figure('units', 'normalized', 'Position', [0 0 1 1]);
subplot(1, 2, 2)
for k = 1:n_provs
    color = determine_color(new_cases_prov_avg_100k(k));
    mapshow(provinces{k}, 'FaceColor', color);
    if k == 1
        hold on;
    end
end
set(get(gca, 'Title'), 'String', 'Provinces Map');

fig_dir = '../figs/';
saveas(f_reg, ([fig_dir, 'hotspots-', day_str, '.png']));

% close(f_reg);

% end

fclose('all');

