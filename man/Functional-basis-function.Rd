% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fctbases.R
\name{Functional basis function}
\alias{Functional basis function}
\title{Functional basis function}
\arguments{
\item{t}{time points}

\item{x}{vector or matrix of coefficients (optional)}

\item{deriv}{Should the derivative be used and which order? Defaults to \code{FALSE}}
}
\value{
Returns a matrix of dimension \code{length(t)} times no. of bases if \code{x} is missing.
If \code{x} is provided and is a vector, it returns a vector of same length as \code{t}. 
If \code{x} is provided and is a matrix, it returns a matrix of dimension \code{length(t)} times \code{ncol(x)}
}
\description{
A fctbases object is a function of class \code{fctbasis} which takes three arguments \code{(t, x, deriv)}
}
\details{
If \code{deriv} is zero or \code{FALSE}, the function itself is evaluated.
If \code{deriv} is one or \code{TRUE}, the first derivative is evaluated.
If \code{deriv} is two, the second derivative is evaluated. 

The dimension of \code{x} must match the number of basis functions.
}
\examples{
## Create basis (here a b spline)
bf <- make.bspline.basis(knots = 0:12/12)

## Use a functional basis

bf(0.2)
tt <- seq(0,1, length = 50)
bf(tt) ## evaluates bf in tt
bf(tt, deriv = TRUE) ## evaluates derivative of bf in tt

## Apply bf to some coefficients
set.seed(661)
x <- runif(15) 
bf(tt, x) ## Evaluate bf in tt with coefficients x. 

bf(0.2, deriv = 2) ## Second derivative.
bf(0.2, x, deriv = 2) ## Second derivative with coefficients x.
}
