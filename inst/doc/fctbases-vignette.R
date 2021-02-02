## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----pakker, warning=FALSE----------------------------------------------------
## Libraries
library(fctbases)
library(microbenchmark)
library(splines)

## ----speed, echo=TRUE---------------------------------------------------------


## Order 4 B-spline, 13 basis functions (10 intervals + 3)
knots <- 0:10 / 10

## the default way using splines::bs
bsb <- function(x) bs(x, knots = knots[2:10], Boundary.knots = c(knots[1], knots[11]), intercept = T)
## fctbases;
bf <- make.bspline.basis(knots = knots)

## some random coefficients and evaluation points
set.seed(3457)
coefs <- rnorm(13)
y <- sort(runif(100))


bf(0.3457)
bsb(0.3457)

microbenchmark(bf(y), bsb(y), times = 1000)
microbenchmark(bf(y, coefs), bsb(y) %*% coefs, times = 1000)



