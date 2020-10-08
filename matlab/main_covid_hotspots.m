%% Initialization

clc; clear; close all;

format long g

%% Data

% Paths
% data_dir = '../../COVID-19/dati-province/';
% file_root = 'dpc-covid19-ita-province-';
data_dir = '../data-pcm-dpc/dati-regioni/';
file_root = 'dpc-covid19-ita-regioni-';

% Avg over last 14 days
n_days = 14;
n_regs = 22;     % Number of regioni
new_cases = zeros(n_days, n_regs);

% Region names
reg_names = cell(n_regs, 1);
reg_names{13, 1} = 'Abruzzo';
reg_names{17, 1} = 'Basilicata';
reg_names{18, 1} = 'Calabria';
reg_names{15, 1} = 'Campania';
reg_names{08, 1} = 'Emilia';
reg_names{06, 1} = 'Friuli';
reg_names{12, 1} = 'Lazio';
reg_names{07, 1} = 'Liguria';
reg_names{03, 1} = 'Lombardia';
reg_names{11, 1} = 'Marche';
reg_names{14, 1} = 'Molise';
reg_names{21, 1} = 'Bolzano';
reg_names{22, 1} = 'Trento';
reg_names{01, 1} = 'Piemonte';
reg_names{16, 1} = 'Puglia';
reg_names{20, 1} = 'Sardegna';
reg_names{19, 1} = 'Sicilia';
reg_names{09, 1} = 'Toscana';
reg_names{10, 1} = 'Umbria';
reg_names{02, 1} = 'Valle d''Aosta';
reg_names{05, 1} = 'Veneto';
reg_names{04, 1} = '---';

% Population
reg_pop = cell(n_regs, 1);
reg_pop{13, 1} = 1305770;
reg_pop{17, 1} = 556934;
reg_pop{18, 1} = 1924701;
reg_pop{15, 1} = 5785861;
reg_pop{08, 1} = 4467118;
reg_pop{06, 1} = 1211357;
reg_pop{12, 1} = 5865544;
reg_pop{07, 1} = 1543127;
reg_pop{03, 1} = 10103969;
reg_pop{11, 1} = 1518400;
reg_pop{14, 1} = 302265;
reg_pop{21, 1} = 533373;
reg_pop{22, 1} = 1074819 - 533373;
reg_pop{01, 1} = 4341375;
reg_pop{16, 1} = 4008296;
reg_pop{20, 1} = 1630474;
reg_pop{19, 1} = 4968410;
reg_pop{09, 1} = 3722729;
reg_pop{10, 1} = 880285;
reg_pop{02, 1} = 125501;
reg_pop{05, 1} = 4907704;
reg_pop{04, 1} = 1;

% Get date
today = datetime - 1;

for j = 1:n_days
    day = today - (n_days - j);
    yyyy = day.Year;
    mm = day.Month;
    dd = day.Day;
    day_str = join([num2str(yyyy), sprintf('%02d', mm), sprintf('%02d', dd)]);
    filename = join([data_dir, file_root, day_str, '.csv']);
    % data = importdata(filename, ',', 1);
    data = csvimport(filename);
    n_rows = size(data, 1);
    for i = 2:n_rows
        % i_reg = data.data(i, 3);
        % new = data.data(i, 13);
        i_reg = data{i, 3};
        new = data{i, 13};
        new_cases(j, i_reg) = new_cases(j, i_reg) + new;
    end
end

new_cases_avg = zeros(n_regs, 1);
for i = 1:n_regs
    for j = 1:n_days
        new_cases_avg(i) = new_cases_avg(i) + new_cases(j, i);
    end
    new_cases_avg(i) = new_cases_avg(i) / n_days;
end

new_cases_avg_100k = new_cases_avg;
for i = 1:n_regs
    new_cases_avg_100k(i) = new_cases_avg_100k(i) .* (100e3 ./ reg_pop{i, 1});
end
[new_cases_avg_100k_sort, ind_sort] = sort(new_cases_avg_100k, 'descend');

%% Print report
today

fprintf('%20s%20s%20s\n', 'Regione', 'Media nuovi casi', 'x100000');
for i = 1:n_regs
    fprintf('%20s%20.2f%20.2f\n', ...
        reg_names{ind_sort(i)}, new_cases_avg(ind_sort(i)), new_cases_avg_100k(ind_sort(i)));
end

% %% Print csv
% file_out = 'report.csv';
% fileID = fopen(file_out, 'w');

% fprintf(fileID, '%s,%s,%s,\n', 'Regione', 'Media nuovi casi', 'x100000');
% for i = 1:n_regs
%     fprintf(fileID, '%s,%.2f,%.2f,\n', ...
%         reg_names{i}, new_cases_avg(i), new_cases_avg_100k(i));
% end

f = figure('units', 'normalized', 'Position', [0 0 1 1]);
map_folder = '../geo/';
load(join([map_folder, 'regions_map.mat']));
for k = 1:n_regs
    color = determine_color(new_cases_avg_100k(k));
    mapshow(regions{k}, 'FaceColor', color);
    if k == 1
        hold on;
    end
end

fclose('all');

