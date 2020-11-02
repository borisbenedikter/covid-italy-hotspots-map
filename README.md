# covid-italy-hotspots-map

This repository provides MATLAB codes to plot maps of the incidence of COVID-19 in Italy.
The data are provided by the "Presidenza del Consiglio dei Ministri" and "Dipartimento della Protezione Civile" (included as git submodule repository).

The main_covid_hotspots.m script computes, for each Italian province, the average number of newly reported COVID-19 cases over the last 7 days and generates a map colored accordingly to the number of new cases with respect to the local population.
The output provides a useful tool to assess the up-to-date incidence and the hot spots of COVID-19 over the entire nation.
An example map is the following:
![alt text](https://github.com/borisbenedikter/covid-italy-hotspots-map/blob/master/figs/scale-0-54/hotspots-20201101.png?raw=true)

The main_covid_icu.m script computes, for each Italian region, the number of patients in intensive care units (ICUs) and compares it to the number of ICU spots available in the corresponding region (data provided by [Il Sole 24 Ore](https://lab24.ilsole24ore.com/coronavirus/)).
Since in non-emergency conditions 50% of ICU spots are free, occupancy rates (due exclusively to COVID-19) above this threshold are to be considered critical.
The Italian National Institute of Health set 30% as emergency threshold.
The map provides a comprehensive overview of the impact of COVID-19 on the national healthcare system.
An example map is the following:
![alt text](https://github.com/borisbenedikter/covid-italy-hotspots-map/blob/master/figs/icu/icu-20201101.png?raw=true)



