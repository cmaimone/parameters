---
title: "Extracting, Computing and Exploring the Parameters of Statistical Models using R"
authors:
- affiliation: 1
  name: Daniel Lüdecke
  orcid: 0000-0002-8895-3206
- affiliation: 2
  name: Mattan S. Ben-Shachar
  orcid: 0000-0002-4287-4801
- affiliation: 3
  name: Indrajeet Patil
  orcid: 0000-0003-1995-6531
- affiliation: 4
  name: Dominique Makowski
  orcid: 0000-0001-5375-9967

date: "01 July 2020"
output: pdf_document
bibliography: paper.bib
csl: apa.csl
tags:
- R
- eaystats
- parameters
- regression
- linear models
- coefficients
affiliations:
- index: 1
  name:  University Medical Center Hamburg-Eppendorf, Germany
- index: 2
  name: Ben-Gurion University of the Negev, Israel
- index: 3
  name: Max Planck Institute for Human Development, Germany
- index: 4
  name: Nanyang Technological University, Singapore
---

# Summary

The recent growth of data science is partly fuelled by the ever-growing amount of data and the joint important developments in statistical modelling. New and powerful models and frameworks are becomming accessible to users, however, although there exist some generic functions to obtain model summaries and parameters, many package-specific modeling functions do not provide such methods to allow users to access such valuable information. 

# Aims of the Package

*parameters* is an R-package [@rcore] that fills this important gap. Its primary goal is to provide utilities for processing the parameters of various statistical models. Beyond computing p-values, standard errors, confidence intervals, Bayesian indices and other measures for a wide variety of models, this package implements features like parameters bootstrapping and engineering (such as variables reduction and/or selection), or tools for data reduction like functions to perform cluster, factor or principal component analysis.

Another important goal of the *parameters* package is to facilitate and streamline the process of reporting results of statistical models, which includes the easy and intuitive calculation of standardized estimates or robust standard errors and p-values. *parameters* therefor offers a simple and unified syntax to process a large variety of (model) objects from many different packages.

Finally, all package-functions return the results as consistent data frame, for further processing in own functions or packages, or ready to easily create nice plots.

The *parameters* package relies on the *insight* and the *bayestestR* packages [@ludecke2019insight; @makowski2019bayetestR] to access and process information contained in models.

# Examples of Features

As stated above, *parameters* creates summary tables of many different statistical models. The workflow is simple: fit a model, put it into the `model_parameters()` functions (or its shortcut, `parameters()`) and the result is complete. 

![](figure1.png)

In the following, we show some brief examples. However, a comprehensive overview including in-depth examples are accessible via the dedicated website (https://easystats.github.io/parameters/).

## Summary of Model Parameters

`model_parameters()` allows you to extract the parameters and their characteristics from various models in a consistent way.

``` r
library(parameters)

model <- lm(Sepal.Length ~ Species, data = iris)
parameters(model)

#> Parameter            | Coefficient |   SE |       95% CI |      p
#> -----------------------------------------------------------------
#> (Intercept)          |        5.01 | 0.07 | [4.86, 5.15] | < .001
#> Species [versicolor] |        0.93 | 0.10 | [0.73, 1.13] | < .001
#> Species [virginica]  |        1.58 | 0.10 | [1.38, 1.79] | < .001
```

Extraction of robust indices is possible for many models, in particular models supported by the *sandwich* [@zeileis2006] and *clubSandwich* [@pustejovsky2020] packages.

``` r
parameters(model, robust = TRUE)

#> Parameter            | Coefficient |   SE |       95% CI |      p
#> -----------------------------------------------------------------
#> (Intercept)          |        5.01 | 0.05 | [4.91, 5.11] | < .001
#> Species [versicolor] |        0.93 | 0.09 | [0.75, 1.11] | < .001
#> Species [virginica]  |        1.58 | 0.10 | [1.38, 1.79] | < .001
```

For linear mixed models, `parameters()` also allows to specify the method for approximating degrees of freedom, which may improve the accurracy for calculated standard errors or p-values.

``` r
library(lme4)
model <- lmer(
  Sepal.Length ~ Sepal.Width * Petal.Length + (1 | Species), 
  data = iris
)

parameters(model, digits = 3)

#> Parameter                  | Coefficient |    SE |         95% CI |      p
#> --------------------------------------------------------------------------
#> (Intercept)                |       0.707 | 0.652 | [-0.57,  1.98] | 0.278 
#> Sepal.Width                |       0.731 | 0.156 | [ 0.43,  1.04] | < .001
#> Petal.Length               |       1.023 | 0.143 | [ 0.74,  1.30] | < .001
#> Sepal.Width * Petal.Length |      -0.084 | 0.040 | [-0.16, -0.01] | 0.035 

parameters(model, digits = 3, df_method = "kenward")

#> Parameter                  | Coefficient |    SE |         95% CI |      p
#> --------------------------------------------------------------------------
#> (Intercept)                |       0.707 | 0.654 | [-0.70,  2.11] | 0.298 
#> Sepal.Width                |       0.731 | 0.157 | [ 0.42,  1.04] | < .001
#> Petal.Length               |       1.023 | 0.145 | [ 0.74,  1.31] | < .001
#> Sepal.Width * Petal.Length |      -0.084 | 0.040 | [-0.16, -0.01] | 0.037 
```

## Visualisation

*parameters* functions also include plotting capabilities via the [*see* package](https://easystats.github.io/see/) [@ludecke2019see]. A complete overview of plotting functions is available at the *see* website (https://easystats.github.io/see/articles/parameters.html).

```r
library(see)

model <- lm(Sepal.Length ~ Petal.Width * Species, data=iris)
plot(parameters(model))
```

![](figure3.png)

# Licensing and Availability

*parameters* is licensed under the GNU General Public License (v3.0), with all source code stored at GitHub (https://github.com/easystats/parameters), and with a corresponding issue tracker for bug reporting and feature enhancements. In the spirit of honest and open science, we encourage requests/tips for fixes, feature updates, as well as general questions and concerns via direct interaction with contributors and developers.

# Acknowledgments

*parameters* is part of the [*easystats*](https://github.com/easystats/easystats) ecosystem, a collaborative project created to facilitate the usage of R. Thus, we would like to thank the [members of easystats](https://github.com/orgs/easystats/people) as well as the users.

# References
