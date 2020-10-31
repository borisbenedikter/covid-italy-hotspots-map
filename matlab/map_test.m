%% Initialization

clc; clear; close all;

format long g

%% Province

name = cell(107, 1);
name{1, 1} = 'L''Aquila';
name{2, 1} = 'Chieti';
name{3, 1} = 'Pescara';
name{4, 1} = 'Teramo';
name{5, 1} = 'Matera';
name{6, 1} = 'Potenza';
name{7, 1} = 'Cosenza';
name{8, 1} = 'Catanzaro';
name{9, 1} = 'Crotone';
name{10, 1} = 'Reggio Calabria';
name{11, 1} = 'Vibo Valentia';
name{12, 1} = 'Avellino';
name{13, 1} = 'Benevento';
name{14, 1} = 'Caserta';
name{15, 1} = 'Napoli';
name{16, 1} = 'Salerno';
name{17, 1} = 'Bologna';
name{18, 1} = 'Forlì Cesena';
name{19, 1} = 'Ferrara';
name{20, 1} = 'Modena';
name{21, 1} = 'Piacenza';
name{22, 1} = 'Parma';
name{23, 1} = 'Ravenna';
name{24, 1} = 'Reggio Emilia';
name{25, 1} = 'Rimini';
name{26, 1} = 'Gorizia';
name{27, 1} = 'Pordenone';
name{28, 1} = 'Trieste';
name{29, 1} = 'Udine';
name{30, 1} = 'Frosinone';
name{31, 1} = 'Latina';
name{32, 1} = 'Rieti';
name{33, 1} = 'Roma';
name{34, 1} = 'Viterbo';
name{35, 1} = 'Genova';
name{36, 1} = 'Imperia';
name{37, 1} = 'La Spezia';
name{38, 1} = 'Savona';
name{39, 1} = 'Bergamo';
name{40, 1} = 'Brescia';
name{41, 1} = 'Como';
name{42, 1} = 'Cremona';
name{43, 1} = 'Lecco';
name{44, 1} = 'Lodi';
name{45, 1} = 'Monza E Brianza';
name{46, 1} = 'Milano';
name{47, 1} = 'Mantova';
name{48, 1} = 'Pavia';
name{49, 1} = 'Sondrio';
name{50, 1} = 'Varese';
name{51, 1} = 'Ancona';
name{52, 1} = 'Ascoli Piceno';
name{53, 1} = 'Fermo';
name{54, 1} = 'Macerata';
name{55, 1} = 'Pesaro Urbino';
name{56, 1} = 'Campobasso';
name{57, 1} = 'Isernia';
name{58, 1} = 'Alessandria';
name{59, 1} = 'Asti';
name{60, 1} = 'Biella';
name{61, 1} = 'Cuneo';
name{62, 1} = 'Novara';
name{63, 1} = 'Torino';
name{64, 1} = 'Verbano-Cusio-Ossola';
name{65, 1} = 'Vercelli';
name{66, 1} = 'Bari';
name{67, 1} = 'Brindisi';
name{68, 1} = 'Barletta Andria Trani';
name{69, 1} = 'Foggia';
name{70, 1} = 'Lecce';
name{71, 1} = 'Taranto';
name{72, 1} = 'Cagliari';
name{73, 1} = 'Nuoro';
name{74, 1} = 'Oristano';
name{75, 1} = 'Sassari';
name{76, 1} = 'Sud Sardegna';
name{77, 1} = 'Agrigento';
name{78, 1} = 'Caltanissetta';
name{79, 1} = 'Catania';
name{80, 1} = 'Enna';
name{81, 1} = 'Messina';
name{82, 1} = 'Palermo';
name{83, 1} = 'Ragusa';
name{84, 1} = 'Siracusa';
name{85, 1} = 'Trapani';
name{86, 1} = 'Arezzo';
name{87, 1} = 'Firenze';
name{88, 1} = 'Grosseto';
name{89, 1} = 'Livorno';
name{90, 1} = 'Lucca';
name{91, 1} = 'Massa Carrara';
name{92, 1} = 'Pisa';
name{93, 1} = 'Prato';
name{94, 1} = 'Pistoia';
name{95, 1} = 'Siena';
name{96, 1} = 'Bolzano';
name{97, 1} = 'Trento';
name{98, 1} = 'Perugia';
name{99, 1} = 'Terni';
name{100, 1} = 'Aosta';
name{101, 1} = 'Belluno';
name{102, 1} = 'Padova';
name{103, 1} = 'Rovigo';
name{104, 1} = 'Treviso';
name{105, 1} = 'Venezia';
name{106, 1} = 'Vicenza';
name{107, 1} = 'Verona';


%% MAP

LAT_max = 47. + 5. / 60. + 29. / 3600.;
LAT_min = 35. + 29. / 60. + 26. / 3600.;
LON_max = 18. + 31. / 60. + 13. / 3600.;
LON_min = 6. + 37. / 60. + 32. / 3600.;

% h = worldmap('Italy');
% land = shaperead('landareas.shp', 'UseGeoCoords', true);
% map_folder = '../geo/';
% shapefile = join([map_folder, 'ne_10m_admin_1_states_provinces.shp']);
map_folder = '../geo/';
prov_folder = 'Limiti01012018_g/ProvCM01012018_g/';
reg_folder = 'Limiti01012018_g/Reg01012018_g/';
shapefile_prov = join([map_folder, prov_folder, 'ProvCM01012018_g_WGS84.shp']);
shapefile_reg = join([map_folder, reg_folder, 'Reg01012018_g_WGS84.shp']);

land_prov = shaperead(shapefile_prov);
land_reg = shaperead(shapefile_reg);

% figure
% mapshow(land_prov);

n_land_prov = size(land_prov, 1);
n_land_reg = size(land_reg, 1);
% provinces_shp = [];
% for k = 1:n_land
%     LAT = land_prov(k).latitude;
%     LON = land_prov(k).longitude;
%     if (LAT >= LAT_min && LAT <= LAT_max && ...
%         LON >= LON_min && LON <= LON_max)
%         if (is_province(land_prov(k)))
%             provinces_shp = [provinces_shp; land_prov(k)];
%             fprintf('%30s\n', land_prov(k).name);
%         end
%     end
% end

% n_prov = size(provinces_shp, 1);
n_regs = 22;     % Number of regions
regions = cell(n_regs, 1);
n_prov_out = 111;
provinces = cell(n_prov_out, 1);
% for k = 1:n_prov
for k = 1:n_land_prov
    ID_prov = land_prov(k).COD_PROV;
    if ID_prov == 21 % Bolzano
        ID_reg = 21;
        regions{ID_reg} = [regions{ID_reg}; land_prov(k)];
    elseif ID_prov == 22
        ID_reg = 22;
        regions{ID_reg} = [regions{ID_reg}; land_prov(k)];
    end
    provinces{ID_prov} = [provinces{ID_prov}; land_prov(k)];
end
for k = 1:n_land_reg
    ID_reg = land_reg(k).COD_REG;
    if ID_reg == 4 % Trentino
        continue;
    end
    regions{ID_reg} = [regions{ID_reg}; land_reg(k)];
end
file_out = join([map_folder, 'regions_and_provinces_map.mat']);
save(file_out, 'regions', 'provinces')

% Colormap intervals
n_levels = 6;
low_level = 0.;
upp_level = 12.;

%% Fig
f_reg = figure('units', 'normalized', 'Position', [0 0 1 1]);
cmap = colormap(flip(hot(n_levels + 2), 1));
for k = 1:n_regs
    rand_val = low_level + rand() * (upp_level - low_level);
    level = determine_level(rand_val, ...
        n_levels, low_level, upp_level);
    mapshow(regions{k}, 'FaceColor', cmap(level, :));
    if k == 1
        hold on;
    end
end

f_prov = figure('units', 'normalized', 'Position', [0 0 1 1]);
cmap = colormap(flip(hot(n_levels + 2), 1));
for k = 1:n_prov_out
    rand_val = low_level + rand() * (upp_level - low_level);
    level = determine_level(rand_val, ...
        n_levels, low_level, upp_level);
    mapshow(provinces{k}, 'FaceColor', cmap(level, :));
    if k == 1
        hold on;
    end
end

fclose('all');

% % h = mapshow(land); %, 'FaceColor', [0.15 0.5 0.15])
% h = mapshow(provinces_shp); %, 'FaceColor', [0.15 0.5 0.15])

