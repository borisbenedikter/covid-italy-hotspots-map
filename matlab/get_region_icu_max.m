function icu_max = get_region_icu_max(ID_reg)

    % Region icu capacity
    n_regs = 22;
    reg_icu_max = cell(n_regs, 1);
    reg_icu_max{13, 1} = 133;
    reg_icu_max{17, 1} = 73;
    reg_icu_max{18, 1} = 152;
    reg_icu_max{15, 1} = 427;
    reg_icu_max{08, 1} = 516;
    reg_icu_max{06, 1} = 175;
    reg_icu_max{12, 1} = 747;
    reg_icu_max{07, 1} = 209;
    reg_icu_max{03, 1} = 983;
    reg_icu_max{11, 1} = 127;
    reg_icu_max{14, 1} = 34;
    reg_icu_max{21, 1} = 55;
    reg_icu_max{22, 1} = 51;
    reg_icu_max{01, 1} = 367;
    reg_icu_max{16, 1} = 366;
    reg_icu_max{20, 1} = 175;
    reg_icu_max{19, 1} = 538;
    reg_icu_max{09, 1} = 415;
    reg_icu_max{10, 1} = 70;
    reg_icu_max{02, 1} = 20;
    reg_icu_max{05, 1} = 825;
    reg_icu_max{04, 1} = 1;

    icu_max = reg_icu_max{ID_reg, 1};

    % SRC: https://www.ilsole24ore.com/art/coronavirus-terapie-intensive-aumento-quali-regioni-sono-pronte-la-seconda-ondata-ADNUkdv?cmpid=nl_coronavirus
end


% Abruzzo	133	11	10,0
% Basilicata	73	0	12,9
% Calabria	152	1	10,5
% Campania	427	64	7,3
% Emilia	516	25	11,5
% Friuli	175	5	14,4
% Lazio	747	78	12,7
% Liguria	209	24	13,4
% Lombardia	983	50	9,8
% Marche	127	5	8,3
% Molise	34	0	11,1
% Bolzano	55	2	10,5
% Trento	51	0	9,4
% Piemonte	367	22	8,4
% Puglia	366	19	9,0
% Sardegna	175	23	10,6
% Sicilia	538	42	10,7
% Toscana	415	40	11,1
% Umbria	70	9	7,9
% Valle	20	3	15,9
% Veneto	825	29	16,8

