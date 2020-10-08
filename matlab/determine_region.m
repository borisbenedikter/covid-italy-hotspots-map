function i_reg = determine_region(province)

    name = get_province_name_list();
    n_prov = size(name, 1);

    i = 1;
    while i <= n_prov
        if (strcmp(province.name, name{i}) == 1)
            break;
        end
        i = i + 1;
    end

    if (i >= 1 && i <= 4)
        i_reg = 13;
    elseif i <= 6
        i_reg = 17;
    elseif i <= 11
        i_reg = 18;
    elseif i <= 16
        i_reg = 15;
    elseif i <= 25
        i_reg = 8;
    elseif i <= 29
        i_reg = 6;
    elseif i <= 34
        i_reg = 12;
    elseif i <= 38
        i_reg = 7;
    elseif i <= 50
        i_reg = 3;
    elseif i <= 55
        i_reg = 11;
    elseif i <= 57
        i_reg = 14;
    elseif i <= 65
        i_reg = 1;
    elseif i <= 71
        i_reg = 16;
    elseif i <= 79
        i_reg = 20;
    elseif i <= 88
        i_reg = 19;
    elseif i <= 98
        i_reg = 9;
    elseif i <= 99
        i_reg = 21;
    elseif i <= 100
        i_reg = 22;
    elseif i <= 102
        i_reg = 10;
    elseif i <= 103
        i_reg = 2;
    elseif i <= 110
        i_reg = 5;
    else
        error('Unknown province name.');
    end
end