function icu_max = get_region_icu_max(ID_reg)

    % Region icu capacity
    n_regs = 22;
    reg_icu_max = cell(n_regs, 1);
    reg_icu_max{13, 1} = 148;       % Abruzzo
    reg_icu_max{17, 1} = 64;        % Basilicata
    reg_icu_max{18, 1} = 152;       % Calabria
    reg_icu_max{15, 1} = 505;       % Campania
    reg_icu_max{08, 1} = 563;       % Emilia
    reg_icu_max{06, 1} = 175;       % Friuli
    reg_icu_max{12, 1} = 847;       % Lazio
    reg_icu_max{07, 1} = 209;       % Liguria
    reg_icu_max{03, 1} = 1036;      % Lombardia
    reg_icu_max{11, 1} = 143;       % Marche
    reg_icu_max{14, 1} = 30;        % Molise
    reg_icu_max{21, 1} = 55;        % Bolzano
    reg_icu_max{22, 1} = 51;        % Trento
    reg_icu_max{01, 1} = 575;       % Piemonte
    reg_icu_max{16, 1} = 369;       % Puglia
    reg_icu_max{20, 1} = 180;       % Sardegna
    reg_icu_max{19, 1} = 588;       % Sicilia
    reg_icu_max{09, 1} = 460;       % Toscana
    reg_icu_max{10, 1} = 97;       % Umbria
    reg_icu_max{02, 1} = 20;        % Valle
    reg_icu_max{05, 1} = 825;      % Veneto
    reg_icu_max{04, 1} = 1;         % ---

    icu_max = reg_icu_max{ID_reg, 1};

    % SRC: https://lab24.ilsole24ore.com/coronavirus/ (28/Oct/2020)
end
