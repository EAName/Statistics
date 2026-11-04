# COVID-19 analysis (ECDC, 2020)

Edwin Salguero's take-home final exam for MSDS 401 Applied Statistics with R (Northwestern University, Fall 2021). The exam asked for descriptive statistics, inferential tests comparing two countries, visualizations, a regression and a short forecast on the ECDC worldwide COVID-19 case data.

- `covid19_ecdc_2020_analysis.Rmd`: the submitted source. The only change is that the data path now points to the CSV in this folder instead of a path on Edwin's laptop.
- `covid19_ecdc_2020_analysis_submitted.pdf`: the report as submitted in December 2021, kept unchanged. Its first code chunk still shows the original local data path.
- `ecdc_covid19_cases_2020.csv` (4.3 MB, 61,900 rows): ECDC "Data on the daily number of new reported COVID-19 cases and deaths by EU/EEA country and worldwide", daily records from 31 Dec 2019 to 14 Dec 2020. Source: European Centre for Disease Prevention and Control, https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide (CSV at https://opendata.ecdc.europa.eu/covid19/casedistribution/csv). ECDC data may be reused with attribution.

## Known limitations (2026 review)

The analysis is published as submitted. A later review found these methodological problems, which are not corrected here:

- The "global incidence rate" is the range (maximum minus minimum) of daily cases per 100,000 across all country-days, and the "fatality rate" is the range of daily deaths divided by the range of daily cases. Neither is an incidence or case fatality rate in the usual sense. The country-level rates in the inferential section are computed the same way.
- The fatality t-test compares daily deaths/cases ratios; days with zero cases give 0/0 and are dropped silently (40 such days for Canada).
- The reported 0.623 is the R-squared of a regression with 211 country indicator variables, not a correlation coefficient. The raw correlation between daily cases and deaths is 0.74.
- `auto.arima()` is fit to all countries' rows stacked into one series, which does not form a time series, so the forecasts are not meaningful.
- The data include 17 rows with negative daily case counts (ECDC corrections) that are not handled.
