function color = determine_color(val)
    
    n_levels = 5;
    cmap = colormap(hot(n_levels + 2));
    cmap = flip(cmap, 1);

    low = 0.;
    upp = 10.;

    step_size = (upp - low) / n_levels;
    
    lev = round((val - low) - (rem(val, step_size)) + 1);

    if lev < 1
        color = cmap(1, :);
    elseif lev > n_levels
        color = cmap(end, :);
    else
        color = cmap(lev + 1, :);
    end
end