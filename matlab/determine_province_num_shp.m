function ID_prov = determine_province_num_shp(province)

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
        ID_prov = 66;
    case 2
        ID_prov = 69;
    case 3
        ID_prov = 68;
    case 4
        ID_prov = 67;
    case 5
        ID_prov = 77;
    case 6
        ID_prov = 76;
    case 7
        ID_prov = 78;
    case 8
        ID_prov = 79;
    case 9
        ID_prov = 101;
    case 10
        ID_prov = 80;
    case 11
        ID_prov = 102;
    case 12
        ID_prov = 64;
    case 13
        ID_prov = 62;
    case 14
        ID_prov = 61;
    case 15
        ID_prov = 63;
    case 16
        ID_prov = 65;
    case 17
        ID_prov = 37;
    case 18
        ID_prov = 40;
    case 19
        ID_prov = 38;
    case 20
        ID_prov = 36;
    case 21
        ID_prov = 33;
    case 22
        ID_prov = 34;
    case 23
        ID_prov = 39;
    case 24
        ID_prov = 35;
    case 25
        ID_prov = 99;
    case 26
        ID_prov = 31;
    case 27
        ID_prov = 93;
    case 28
        ID_prov = 32;
    case 29
        ID_prov = 30;
    case 30
        ID_prov = 60;
    case 31
        ID_prov = 59;
    case 32
        ID_prov = 57;
    case 33
        ID_prov = 58;
    case 34
        ID_prov = 56;
    case 35
        ID_prov = 10;
    case 36
        ID_prov = 8;
    case 37
        ID_prov = 11;
    case 38
        ID_prov = 9;
    case 39
        ID_prov = 16;
    case 40
        ID_prov = 17;
    case 41
        ID_prov = 13;
    case 42
        ID_prov = 19;
    case 43
        ID_prov = 97;
    case 44
        ID_prov = 98;
    case 45
        ID_prov = 108;
    case 46
        ID_prov = 15;
    case 47
        ID_prov = 20;
    case 48
        ID_prov = 18;
    case 49
        ID_prov = 14;
    case 50
        ID_prov = 12;
    case 51
        ID_prov = 42;
    case 52
        ID_prov = 44;
    case 53
        ID_prov = 109;
    case 54
        ID_prov = 43;
    case 55
        ID_prov = 41;
    case 56
        ID_prov = 70;
    case 57
        ID_prov = 94;
    case 58
        ID_prov = 6;
    case 59
        ID_prov = 5;
    case 60
        ID_prov = 96;
    case 61
        ID_prov = 4;
    case 62
        ID_prov = 3;
    case 63
        ID_prov = 1;
    case 64
        ID_prov = 103;
    case 65
        ID_prov = 2;
    case 66
        ID_prov = 72;
    case 67
        ID_prov = 74;
    case 68
        ID_prov = 110;
    case 69
        ID_prov = 71;
    case 70
        ID_prov = 75;
    case 71
        ID_prov = 73;
    case 72
        ID_prov = 92;
    case 73
        ID_prov = 91;
    case 74
        ID_prov = 95;
    case 75
        ID_prov = 90;
    case 76
        ID_prov = 111;
    case 77
        ID_prov = 90;
    case 78
        ID_prov = 111;
    case 79
        ID_prov = 91;
    case 80
        ID_prov = 84;
    case 81
        ID_prov = 85;
    case 82
        ID_prov = 87;
    case 83
        ID_prov = 86;
    case 84
        ID_prov = 83;
    case 85
        ID_prov = 82;
    case 86
        ID_prov = 88;
    case 87
        ID_prov = 89;
    case 88
        ID_prov = 81;
    case 89
        ID_prov = 51;
    case 90
        ID_prov = 48;
    case 91
        ID_prov = 53;
    case 92
        ID_prov = 49;
    case 93
        ID_prov = 46;
    case 94
        ID_prov = 45;
    case 95
        ID_prov = 50;
    case 96
        ID_prov = 100;
    case 97
        ID_prov = 47;
    case 98
        ID_prov = 52;
    case 99
        ID_prov = 21;
    case 100
        ID_prov = 22;
    case 101
        ID_prov = 54;
    case 102
        ID_prov = 55;
    case 103
        ID_prov = 7;
    case 104
        ID_prov = 25;
    case 105
        ID_prov = 28;
    case 106
        ID_prov = 29;
    case 107
        ID_prov = 26;
    case 108
        ID_prov = 27;
    case 109
        ID_prov = 24;
    case 110
        ID_prov = 23;
    otherwise
        error('Unknown province name.');
    end
end