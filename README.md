# prmisc

Miscellaneous printing of stat results in Rmarkdown.

# Installation

```R
library("devtools") # if not available: install.packages("devtools")
install_github("m-Py/prmisc")

# load the package via 
library("prmisc")
```

# Usage 

## t.test

```R
ttest <- t.test(1:10, y = c(7:20), var.equal = TRUE)
library("effsize") # for Cohen's d
cohend <- cohen.d(1:10, c(7:20))
print_ttest(ttest, cohend) # include this call in Rmd inline code

# [1] "$t(22) = -5.15$, $p < .001$, $d = -2.13$"

# check out help:
?print_ttest
```

## chi-square-test

```R
x <- matrix(c(12, 5, 7, 7), ncol = 2)
print_chi2(table = x) # does not use continuity correction

# [1] "$\\chi^2(1, N = 31) = 1.37$, $p = .242$, $\\phi = .21$"
```

## Correlation coefficient

```R
x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)
cor_results <- cor.test(x, y)

print_cortest(cor_results)

# [1] "$r = .57$, $p = .108$"
```

## ANOVA

```R
library("afex")
# see ?aov_ez
data(md_12.1)
aov_results <- aov_ez("id", "rt", md_12.1, within = c("angle", "noise"))

print_anova(aov_results, 1, es = "ges") # first effect
# [1] "$F(1.92$, $17.31) = 40.72$, $p < .001$, $\\upeta_\\mathrm{G}^2 = .39$"

print_anova(aov_results, 1, es = "ges", font = "italic") # use standard italic eta symbol 
# [1] "$F(1.92$, $17.31) = 40.72$, $p < .001$, $\\eta_G^2 = .39$"

print_anova(aov_results, 2, es = "ges", font = "italic") # second effect
# [1] "$F(1$, $9) = 33.77$, $p < .001$, $\\eta_G^2 = .39$"

print_anova(aov_results, 3, es = "ges", font = "italic") # interaction effect
# [1] "$F(1.81$, $16.27) = 45.31$, $p < .001$, $\\eta_G^2 = .19$"
```

## Some functions for printing numbers

```R
## Round will not produce the same results in Rmd
force_decimals(c(1.23456, 0.873, 2.3456), n_digits = 2)
# [1] "1.23" "0.87" "2.35"

## Leave integers intact:
force_or_cut(c(1:3, 1.23456, 0.873, 2.3456), n_digits = 2)
# [1] "1"    "2"    "3"    "1.23" "0.87" "2.35"
## Compare: 
force_decimals(c(1:3, 1.23456, 0.873, 2.3456), n_digits = 2)
# [1] "1.00" "2.00" "3.00" "1.23" "0.87" "2.35"

## Show only decimals (e.g., fpr p-values or correlation coefficients)
decimals_only(c(0.23456, 0.873, 0.3456), n_digits = 3)
# [1] ".235" ".873" ".346"
```
