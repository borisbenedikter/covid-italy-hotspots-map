function out = is_province(land)
    
name = get_province_name_list_shp();
n_prov = size(name, 1);

out = false;
    for k = 1:n_prov
        if (strcmp(land.name, name{k}) == 1)
            out = true;
            break;
        end
    end

end