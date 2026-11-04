# MSDS 401 assignments (original work)

Edwin Salguero's submitted assignments for MSDS 401 Applied Statistics with R (Northwestern University, Fall 2021). Each folder holds the R Markdown source and the HTML report rendered from it. The question text in each .Rmd comes from the course templates; the code and written answers are Edwin's. Each .Rmd opens with a "Revision note (2026)" listing the code errors corrected for this repository, and the HTML was re-rendered from the corrected source.

| Folder | What the assignment asked |
|---|---|
| `r-assignment-1/` | R basics: vector manipulation, a user-defined trigonometric function and its maximum, the intersection of two curves, summaries of the `trees` dataset, and a comparison of normal and t-distributed samples with histograms, boxplots and QQ plots. |
| `r-assignment-2/` | Poisson and normal approximations to the binomial, the mean, variance and median of a discrete distribution, conditional probability and Kendall's tau on `faithful`, two-sample and paired t-tests on `ChickWeight`, CLT sampling distributions on `Nile`, and a chi-square test of independence on `warpbreaks` computed by hand and as a function. |
| `data-analysis-1-abalone-eda/` | Exploratory data analysis of 1,036 abalones: summaries, contingency tables, scatterplots, outlier identification by sex, and growth patterns by age class, with essay answers on why the original age-prediction study failed. |
| `data-analysis-2-abalone-harvest/` | Log transformation and Bartlett's test, two-way ANOVA with Tukey comparisons, regression of log shuck weight on log volume, class and type with residual checks, and a volume-cutoff harvest rule evaluated with an ROC curve and AUC. |

## Data

- `data-analysis-1-abalone-eda/abalones.csv` (1,036 rows): the course-provided abalone data, a subset of the UCI Machine Learning Repository Abalone dataset (https://archive.ics.uci.edu/dataset/1/abalone) with measurements rescaled and RINGS grouped into CLASS.
- `data-analysis-2-abalone-harvest/mydata.csv`: the same 1,036 abalones with the VOLUME and RATIO columns added in Data Analysis 1, as posted on the course site.
- R Assignments 1 and 2 use only datasets that ship with R (`trees`, `faithful`, `ChickWeight`, `Nile`, `warpbreaks`).

Each .Rmd reads its CSV by relative path, so knit it from its own folder.
