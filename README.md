# Statistics

Northwestern University, M.S. in Data Science (Data Engineering specialization) · MSDS 401: Applied Statistics with R

## Overview

This is the statistics foundation course of the degree, done in R: descriptive statistics, probability, sampling distributions, confidence intervals, hypothesis tests, ANOVA, and multiple regression. Each script works textbook problems (Black, *Business Statistics*) and checks R's built-in tests against the hand calculation. For a data engineer the useful parts are the habits: checking distributional assumptions before trusting a test, comparing a naive bivariate result with a model that controls for other variables, and reading residuals before reading coefficients.

## Highlights / Results

There are no saved outputs for R scripts, so this table describes what each analysis tests. The only numbers quoted are ones written into the script comments from the original run.

| Work | Method | What it tests / result | Source |
|------|--------|------------------------|--------|
| Home sale price model (32 sales) | `lm(Sales ~ Taxes + Baths + Fire)`, then drop `Fire`; residual histogram, QQ plot, residuals vs. fitted | Whether taxes, bath count, and fireplaces explain sale price. Comments record F = 42.0 (p = 1.694e-10), multiple R-squared 0.8183, and that `Fire` is not significant | `Multiple Linear Regression.R` |
| Naive test vs. regression | Two-sample `t.test` of price by bath count, compared with the bath coefficient in the regression | Shows omitted-variable bias: comments record a $15.2k difference from the t-test vs. a 5.764 (thousand) bath effect once taxes are in the model | `Multiple Linear Regression.R` |
| Valve openings by operator | One-way `aov`, Bartlett test for equal variances, F critical region plot, `TukeyHSD` | Whether four operators produce different mean openings, after checking the equal-variance assumption | `One-Way Analysis of Variance and Correlation.R` |
| Tire wear by speed, blocked by supplier | Randomized complete block design (`aov(output ~ supplier + speed)`), Tukey on speed | Whether speed affects wear once supplier-to-supplier variation is removed | `One-Way Analysis of Variance and Correlation.R` |
| Pipe openings by machine and shift | Two-way ANOVA with and without interaction, Tukey, residual diagnostics | Whether machines behave consistently across shifts (interaction term) | `One-Way Analysis of Variance and Correlation.R` |
| Two-sample comparisons | Two-sample z (hand-built function), `t.test`, `var.test`, paired `t.test`, two-proportion `prop.test` | Equality of means and variances for independent and paired samples; difference in proportions | `Statistical Inferences about Two Populations.R` |
| Single-population tests and power | z and t tests, `prop.test` vs. exact `binom.test`, chi-square variance test, Type II error and power curves | When z and t disagree on the same data, and how power changes with sample size and alpha | `Statistical Inference - Hypothesis Testing for Single Populations.R` |
| Confidence intervals and sample size | z intervals with finite population correction, `t.test`, `prop.test`, chi-square variance interval | Interval construction and planning sample size for a target margin of error | `Statistical Inference - Estimation for Single Populations.R` |
| Central Limit Theorem | Simulation with `set.seed(123)`, 10,000 sample means | Empirical sampling distribution of the mean vs. the theoretical normal | `Continuous Distributions and Sampling.R` |

## Engineering decisions and tradeoffs

- **Hand calculation next to the library call.** R has no built-in z-test, so the scripts build z statistics and two-tailed p-values as small functions, then confirm with `t.test`, `prop.test`, and `binom.test` where those exist. Doing both catches formula mistakes.
- **Assumption checks before inference.** ANOVA is preceded by `bartlett.test` for equal variances; regression and ANOVA are followed by QQ plots, residual histograms, and residuals vs. fitted plots. Normality is checked with skewness and kurtosis from `moments`.
- **Blocking instead of ignoring a nuisance factor.** The tire wear analysis uses an RCBD so supplier differences are removed from the error term, with a `ggplot2` line plot showing why that matters.
- **Exact vs. approximate tests.** The proportion examples run both `prop.test` (normal approximation) and `binom.test` (exact), and the binomial-to-normal approximation is plotted to show when `np > 5` is good enough.
- **Statistical vs. material significance.** The regression script ends by comparing the bath effect to the residual standard error and to the average sale price, to ask whether a significant coefficient is large enough to matter.

## Limitations and what I would do differently today

- The scripts are linear walk-throughs with values typed in from the textbook (for example, the residual standard error `std <- 5.523` and the fitted line intercepts are hardcoded rather than pulled from the model object). Today I would extract them from `summary(model)` so the script stays correct if the data changes.
- No saved outputs. I would render each script to HTML with `rmarkdown::render` or convert to Quarto so results are visible without running anything.
- Datasets are not bundled or versioned. I would add a small `data/README` with checksums, or pull the data from a pinned source.
- Package versions are not pinned. `renv` would lock them.
- Regression stops at in-sample fit on 32 rows. I would add cross-validation or at least a holdout check before using it for prediction.

## Repository map

| Script | Topic |
|--------|-------|
| `Multiple Linear Regression.R` | EDA with boxplots and `ggplot2`; factor coding for ordinal predictors; `lm()` model building and simplification; R-squared and coefficient inference; residual diagnostics; naive t-test vs. regression (omitted-variable bias) |
| `One-Way Analysis of Variance and Correlation.R` | One-way ANOVA with Bartlett check, F critical region plot, Tukey HSD; randomized complete block design; two-way ANOVA with interaction; residual diagnostics |
| `Statistical Inferences about Two Populations.R` | Two-sample z and t tests; F-test for equal variances; paired comparisons; two-proportion test from a contingency table |
| `Statistical Inference - Hypothesis Testing for Single Populations.R` | z and t tests for means; `prop.test`, `binom.test`; chi-square variance test; Type I/II error and power |
| `Statistical Inference - Estimation for Single Populations.R` | z and t confidence intervals; finite population correction; proportion and variance intervals; sample-size planning |
| `Continuous Distributions and Sampling.R` | Normal pdf/cdf/quantiles; z-scores; skewness and kurtosis; QQ plots; normal approximation to the binomial; CLT simulation; sampling distributions |
| `Probability and Discrete Distributions.R` | Counting problems; contingency-table probability rules; Bayes' theorem on hospital data; binomial, hypergeometric, and Poisson distributions |
| `Data Visualizations.R` | Pie, bar, stacked, and Pareto charts; histograms, frequency polygons, ogives, stem-and-leaf; grouped summaries with `tapply`; contingency tables on melanoma patient data |
| `Measures of Central Tendency.R` | Mean, trimmed mean, median, mode; range, standard deviation, coefficient of variation, Winsorized SD; quartile methods; boxplots and histograms; grouped-data mean and SD |
| `install.R` | Installs the R packages the scripts use |

## Reproducing

- R 4.x. Install packages with `Rscript install.R` (installs `moments`, `ggplot2`, `qcc`, `asbio`).
- Data files are not bundled. Each script that reads data uses a single `data_dir` set at the top: it reads the `DATA_DIR` environment variable and falls back to a `data/` folder next to the scripts. For example: `DATA_DIR=~/msds401-data Rscript "Multiple Linear Regression.R"`.
- CSV files each script expects in `data_dir`:

| Script | Files |
|--------|-------|
| `Multiple Linear Regression.R` | `homes.csv` (columns `Sales`, `Taxes`, `Baths`, `Fire`; 32 home sales) |
| `One-Way Analysis of Variance and Correlation.R` | `operator.csv` (columns `yield`, `operator`), `supplier_rcbd.csv` (columns `output`, `supplier`, `speed`), `pipe.csv` (columns `openings`, `machine`, `shift`) |
| `Probability and Discrete Distributions.R` | `Hospital.csv` (uses `Control`, `Geog..Region`, `Service` columns) |
| `Data Visualizations.R` | `tumor.csv` (205 melanoma patients: `status`, `sex`, `age`, `thickness`, `ulcer`) |
| All other scripts | No files; data is defined inline |

- The datasets came from the course and the Black *Business Statistics* textbook materials.
- Scripts are meant to be stepped through interactively in RStudio; several call `help()`.

## Stack

| Layer | Tools |
|-------|-------|
| Language | R |
| Environment | RStudio |
| Visualization | base R graphics, ggplot2, qcc (Pareto charts) |
| Inference | base R (`t.test`, `prop.test`, `binom.test`, `var.test`, `aov`, `TukeyHSD`, `bartlett.test`) |
| Regression | `lm`, `summary`, `residuals`, `fitted` |
| Distributions | `dnorm`, `pnorm`, `qnorm`, `dbinom`, `pbinom`, `dpois`, `dhyper`, `qf`, `qchisq`, `rnorm`, `rbinom` |
| Utilities | `moments` (skewness/kurtosis), `asbio` (Winsorized SD), `read.csv`, `aggregate`, `table`, `prop.table` |
