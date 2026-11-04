# Statistics

Graduate coursework in descriptive statistics, probability, inference, ANOVA, and regression using R scripts aligned to business statistics methods and interpretation.

---

## 1. Title and Summary

**Statistics**  
Northwestern University M.S. in Data Science (Data Engineering specialization): end-to-end statistical analysis in R covering EDA, discrete and continuous distributions, confidence intervals, hypothesis tests, two-sample inference, ANOVA designs, and multiple linear regression with diagnostic checking.

---

## 2. Featured Project: COVID-19 Incidence and Mortality Analysis (ECDC, 2020)

A statistical analysis in R (dplyr, ggplot2, forecast) of the European Centre for Disease Prevention and Control's 2020 COVID-19 records, covering daily cases, deaths, and cumulative totals by country.

**Descriptive analysis:** Daily incidence and fatality rates were computed globally and by country, and quartile-based summaries showed wide variability across countries and over time.

**Inferential analysis:** Welch's t-tests found statistically significant differences between the United States and Canada in both incidence and fatality rates. A multiple linear regression of deaths on cases, population, and country-level variables showed a moderate positive relationship, useful for explaining the drivers of mortality but not strong enough on its own for reliable prediction.

**Forecasting:** ARIMA models projected gradual increases in cases and deaths, with wide prediction intervals reflecting how quickly the pandemic was changing.

**Trends:** Monthly visualizations showed deaths peaking in spring 2020 and cases peaking in the fall.

**Why it matters:** Comparing country-level outcomes and forecasting disease trends gives public health agencies and healthcare organizations a basis for resource allocation, operational planning, and risk mitigation. Adding real-time data and broader predictors would be the next step toward more accurate forecasts.

**About this repository:** The scripts here cover the course's core statistical methods.

---

## R Markdown analyses

- `covid-19-analysis/`: country-level analysis and forecasting of ECDC COVID-19 case and death data (R Markdown and data).
- `assignments/r-assignment-1/`: vectors, functions and probability distributions in R.
- `assignments/r-assignment-2/`: probability, confidence intervals, hypothesis tests and chi-square analysis.
- `assignments/data-analysis-1-abalone-eda/`: exploratory data analysis of the abalone dataset.
- `assignments/data-analysis-2-abalone-harvest/`: ANOVA, regression and an ROC-based harvest cutoff on the abalone dataset.

---

## 3. Concepts and Methods

- **Descriptive statistics and EDA:** mean, trimmed mean, median, mode; quartiles; stem-and-leaf, boxplots, histograms with custom bins; weighted statistics and dispersion (`Measures of Central Tendency.R`)
- **Data visualization:** pie charts, bar plots, stacked displays; scatterplots; grouped summaries with `tapply`; contingency tables and marginal/row/column proportions on melanoma patient data (`Data Visualizations.R`)
- **Probability and discrete distributions:** contingency-table probability rules; Bayes' Theorem with hospital region/type example; binomial, hypergeometric, and Poisson pmf/cdf/quantiles (`Probability and Discrete Distributions.R`)
- **Continuous distributions and sampling:** normal pdf/cdf/quantiles; z-score transformations; normality assessment via skewness/kurtosis (`moments`); histogram with density overlay; Central Limit Theorem simulation; sampling distribution demonstrations (`Continuous Distributions and Sampling.R`)
- **Single-population estimation:** z- and t-based confidence intervals; finite population correction; proportion and variance interval estimation; sample-size planning; binomial-to-normal convergence demo (`Statistical Inference - Estimation for Single Populations.R`)
- **Single-population hypothesis testing:** z- and t-tests for means; proportion tests (`prop.test`, `binom.test`); chi-square variance tests; Type I/II error and power visualization with normal curves (`Statistical Inference - Hypothesis Testing for Single Populations.R`)
- **Two-population inference:** two-sample z and t-tests; F-test for equality of variances; paired and independent comparisons; two-proportion test from contingency counts (`Statistical Inferences about Two Populations.R`)
- **ANOVA and designed experiments:** one-way ANOVA with Bartlett homogeneity check, F critical-region plots, Tukey HSD; randomized complete block design (RCBD); two-way ANOVA with interaction; residual diagnostics (histogram, QQ, fitted vs. residual ggplot) (`One-Way Analysis of Variance and Correlation.R`)
- **Multiple linear regression:** EDA with boxplots and ggplot2; factor coding for ordinal predictors; `lm()` model building and simplification; R-squared and coefficient inference; residual normality QQ/histogram; leverage of omitted-variable bias illustrated via naive t-test vs. regression (`Multiple Linear Regression .R`)

**Data dependencies:** several scripts read CSVs from external paths (e.g., `c:/Rdata/homes.csv`, `operator.csv`, `tumor.csv`) not bundled in this repository

---

## 4. Stack

| Layer | Tools |
|-------|-------|
| Language | R |
| Environment | RStudio (referenced in scripts) |
| Visualization | base R graphics, ggplot2 |
| Inference | base R (`t.test`, `prop.test`, `binom.test`, `var.test`, `aov`, `TukeyHSD`, `bartlett.test`) |
| Regression | `lm`, `summary`, `residuals`, `fitted` |
| Distributions | `dnorm`, `pnorm`, `qnorm`, `dbinom`, `pbinom`, `dpois`, `dhyper`, `qf`, `qchisq`, `rnorm`, `rbinom` |
| Utilities | `moments` (skewness/kurtosis), `read.csv`, `aggregate`, `table`, `prop.table` |

---

## 5. Structure

```
Statistics/
├── Measures of Central Tendency.R
├── Data Visualizations.R
├── Probability and Discrete Distributions.R
├── Continuous Distributions and Sampling.R
├── Statistical Inference - Estimation for Single Populations.R
├── Statistical Inference - Hypothesis Testing for Single Populations.R
├── Statistical Inferences about Two Populations.R
├── One-Way Analysis of Variance and Correlation.R
├── Multiple Linear Regression .R
└── README.md
```

- **Organization:** one R script per course module; Business Statistics chapter references embedded in comments
- **Reusable modules:** none; helper functions defined inline (e.g., custom z-test statistic, summary stats)
- **Engineering practice:** manual critical-value shading on density curves alongside built-in test functions; diagnostic plots after ANOVA/regression; explicit comparison of naive bivariate tests vs. multivariate models

---

**Course context:** Northwestern University, M.S. in Data Science, Data Engineering specialization  
**Repository:** https://github.com/EAName/Statistics
