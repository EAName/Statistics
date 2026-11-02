# Packages used by the scripts in this repository (found via require()/library()).
# Run once: Rscript install.R
pkgs <- c(
  "moments",  # skewness() and kurtosis(): Continuous Distributions and Sampling.R, Multiple Linear Regression.R
  "ggplot2",  # plots: Multiple Linear Regression.R, One-Way Analysis of Variance and Correlation.R
  "qcc",      # pareto.chart(): Data Visualizations.R
  "asbio"     # win() for Winsorized standard deviation: Measures of Central Tendency.R
)
missing <- setdiff(pkgs, rownames(installed.packages()))
if (length(missing) > 0) install.packages(missing, repos = "https://cloud.r-project.org")
