function pop = get_region_pop(i_reg)

    % Region Population
    n_regs = 22;
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

    pop = reg_pop{i_reg, 1};
end