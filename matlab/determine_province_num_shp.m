function i_prov = determine_province_num_shp(province)

    name = get_province_name_list_shp();
    n_prov = size(name, 1);

    i = 1;
    while i <= n_prov
        if (strcmp(province.name, name{i}) == 1)
            break;
        end
        i = i + 1;
    end

    switch i
    case 1
        i_prov = 66;
    case 2
        i_prov = 69;
    case 3
        i_prov = 68;
    case 4
        i_prov = 67;
    case 5
        i_prov = 77;
    case 6
        i_prov = 76;
    case 7
        i_prov = 78;
    case 8
        i_prov = 79;
    case 9
        i_prov = 101;
    case 10
        i_prov = 80;
    case 11
        i_prov = 102;
    case 12
        i_prov = 64;
    case 13
        i_prov = 62;
    case 14
        i_prov = 61;
    case 15
        i_prov = 63;
    case 16
        i_prov = 65;
    case 17
        i_prov = 37;
    case 18
        i_prov = 40;
    case 19
        i_prov = 38;
    case 20
        i_prov = 36;
    case 21
        i_prov = 33;
    case 22
        i_prov = 34;
    case 23
        i_prov = 39;
    case 24
        i_prov = 35;
    case 25
        i_prov = 99;
    case 26
        i_prov = 31;
    case 27
        i_prov = 93;
    case 28
        i_prov = 32;
    case 29
        i_prov = 30;
    case 30
        i_prov = 60;
    case 31
        i_prov = 59;
    case 32
        i_prov = 57;
    case 33
        i_prov = 58;
    case 34
        i_prov = 56;
    case 35
        i_prov = 10;
    case 36
        i_prov = 8;
    case 37
        i_prov = 11;
    case 38
        i_prov = 9;
    case 39
        i_prov = 16;
    case 40
        i_prov = 17;
    case 41
        i_prov = 13;
    case 42
        i_prov = 19;
    case 43
        i_prov = 97;
    case 44
        i_prov = 98;
    case 45
        i_prov = 108;
    case 46
        i_prov = 15;
    case 47
        i_prov = 20;
    case 48
        i_prov = 18;
    case 49
        i_prov = 14;
    case 50
        i_prov = 12;
    case 51
        i_prov = 42;
    case 52
        i_prov = 44;
    case 53
        i_prov = 109;
    case 54
        i_prov = 43;
    case 55
        i_prov = 41;
    case 56
        i_prov = 70;
    case 57
        i_prov = 94;
    case 58
        i_prov = 6;
    case 59
        i_prov = 5;
    case 60
        i_prov = 96;
    case 61
        i_prov = 4;
    case 62
        i_prov = 3;
    case 63
        i_prov = 1;
    case 64
        i_prov = 103;
    case 65
        i_prov = 2;
    case 66
        i_prov = 72;
    case 67
        i_prov = 74;
    case 68
        i_prov = 110;
    case 69
        i_prov = 71;
    case 70
        i_prov = 75;
    case 71
        i_prov = 73;
    case 72
        i_prov = 92;
    case 73
        i_prov = 91;
    case 74
        i_prov = 95;
    case 75
        i_prov = 90;
    case 76
        i_prov = 111;
    case 77
        i_prov = 90;
    case 78
        i_prov = 111;
    case 79
        i_prov = 91;
    case 80
        i_prov = 84;
    case 81
        i_prov = 85;
    case 82
        i_prov = 87;
    case 83
        i_prov = 86;
    case 84
        i_prov = 83;
    case 85
        i_prov = 82;
    case 86
        i_prov = 88;
    case 87
        i_prov = 89;
    case 88
        i_prov = 81;
    case 89
        i_prov = 51;
    case 90
        i_prov = 48;
    case 91
        i_prov = 53;
    case 92
        i_prov = 49;
    case 93
        i_prov = 46;
    case 94
        i_prov = 45;
    case 95
        i_prov = 50;
    case 96
        i_prov = 100;
    case 97
        i_prov = 47;
    case 98
        i_prov = 52;
    case 99
        i_prov = 21;
    case 100
        i_prov = 22;
    case 101
        i_prov = 54;
    case 102
        i_prov = 55;
    case 103
        i_prov = 7;
    case 104
        i_prov = 25;
    case 105
        i_prov = 28;
    case 106
        i_prov = 29;
    case 107
        i_prov = 26;
    case 108
        i_prov = 27;
    case 109
        i_prov = 24;
    case 110
        i_prov = 23;
    otherwise
        error('Unknown province name.');
    end
end