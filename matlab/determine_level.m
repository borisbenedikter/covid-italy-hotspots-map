function level = determine_level(val, n_levels, low, upp)
    
    step_size = (upp - low) / n_levels;
    
    level = ceil(val / step_size) + 1;

    if level < 1
        level = 1;
    elseif level > n_levels + 2
        level = n_levels + 2;
    end
end