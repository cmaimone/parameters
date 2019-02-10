
# parameters <img src='man/figures/logo.png' align="right" height="139" />

[![Build
Status](https://travis-ci.org/easystats/parameters.svg?branch=master)](https://travis-ci.org/easystats/parameters)
[![codecov](https://codecov.io/gh/easystats/parameters/branch/master/graph/badge.svg)](https://codecov.io/gh/easystats/parameters)
[![HitCount](http://hits.dwyl.io/easystats/parameters.svg)](http://hits.dwyl.io/easystats/parameters)
[![Documentation](https://img.shields.io/badge/documentation-parameters-orange.svg?colorB=E91E63)](https://easystats.github.io/parameters/)

***Describe and understand your model’s parameters\!***

`parameters`’s primary goal is to provide utilities for processing the
parameters of various statistical models.

## Installation

Run the following:

``` r
install.packages("devtools")
devtools::install_github("easystats/parameters")
```

``` r
library("parameters")
```

## Examples

### General Linear Models

``` r
model <- lm(mpg ~ wt + cyl, data = mtcars)
model_parameters(model, standardize = TRUE)
```

| Parameter   |   beta |   SE |      t | DoF\_residual | p | CI\_low | CI\_high | Std\_beta | Std\_SE | Std\_CI\_low | Std\_CI\_high |
| :---------- | -----: | ---: | -----: | ------------: | -: | ------: | -------: | --------: | ------: | -----------: | ------------: |
| (Intercept) |  39.69 | 1.71 |  23.14 |            29 | 0 |   36.18 |    43.19 |      0.00 |    0.08 |       \-0.15 |          0.15 |
| wt          | \-3.19 | 0.76 | \-4.22 |            29 | 0 |  \-4.74 |   \-1.64 |    \-0.52 |    0.12 |       \-0.77 |        \-0.27 |
| cyl         | \-1.51 | 0.41 | \-3.64 |            29 | 0 |  \-2.36 |   \-0.66 |    \-0.45 |    0.12 |       \-0.70 |        \-0.20 |

### Bootstrapped Models

``` r
model <- lm(mpg ~ wt + cyl, data = mtcars)
```

| Parameter   | Median |  MAD | CI\_low | CI\_high |  pd | ROPE\_Percentage | ROPE\_Equivalence |
| :---------- | -----: | ---: | ------: | -------: | --: | ---------------: | :---------------- |
| (Intercept) |  39.73 | 2.09 |   35.87 |    44.24 | 100 |                0 | rejected          |
| wt          | \-3.23 | 0.66 |  \-4.90 |   \-2.02 | 100 |                0 | rejected          |
| cyl         | \-1.48 | 0.35 |  \-2.23 |   \-0.76 | 100 |                0 | rejected          |

### Bayesian Models

``` r
library(rstanarm)
model <- stan_glm(mpg ~ wt + cyl, data = mtcars)
```

| Parameter   | Median |  MAD | CI\_low | CI\_high |     pd | ROPE\_Percentage | ROPE\_Equivalence |
| :---------- | -----: | ---: | ------: | -------: | -----: | ---------------: | :---------------- |
| (Intercept) |  39.68 | 1.80 |   36.86 |    42.75 | 100.00 |                0 | rejected          |
| wt          | \-3.17 | 0.80 |  \-4.36 |   \-1.80 |  99.98 |                0 | rejected          |
| cyl         | \-1.52 | 0.42 |  \-2.21 |   \-0.78 |  99.98 |                0 | rejected          |
