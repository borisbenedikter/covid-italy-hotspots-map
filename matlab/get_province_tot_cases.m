function tot_cases_prov = get_province_tot_cases(day)

    % Paths
    data_dir = '../data-pcm-dpc/';
    data_dir_prov = join([data_dir, 'dati-province/']);
    file_root_prov = 'dpc-covid19-ita-province-';

    % Day
    yyyy = day.Year;
    mm = day.Month;
    dd = day.Day;
    day_str = join([num2str(yyyy), sprintf('%02d', mm), sprintf('%02d', dd)]);

    % Init
    n_provs = 111;
    tot_cases_prov = zeros(n_provs, 1);

    % Provinces file
    file_prov = join([data_dir_prov, file_root_prov, day_str, '.csv']);
    data_prov = csvimport(file_prov);
    n_rows = size(data_prov, 1);
    for i = 2:n_rows
        i_prov = data_prov{i, 5};
        if i_prov > n_provs
            continue;
        end
        tot_cases_prov(i_prov) = data_prov{i, 10};
    end
    
end