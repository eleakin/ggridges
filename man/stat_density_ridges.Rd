% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stats.R
\docType{data}
\name{stat_density_ridges}
\alias{stat_density_ridges}
\alias{StatDensityRidgesOld}
\alias{StatDensityRidges}
\title{Stat for density ridgeline plots}
\usage{
stat_density_ridges(mapping = NULL, data = NULL, geom = "density_ridges",
  position = "identity", na.rm = FALSE, show.legend = NA,
  inherit.aes = TRUE, bandwidth = NULL, from = NULL, to = NULL,
  calc_ecdf = FALSE, quantiles = 4, ...)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[=aes]{aes()}} or
\code{\link[=aes_]{aes_()}}. If specified and \code{inherit.aes = TRUE} (the
default), it is combined with the default mapping at the top level of the
plot. You must supply \code{mapping} if there is no plot mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[=ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame.}, and
will be used as the layer data.}

\item{geom}{The geometric object to use to display the data.}

\item{position}{Position adjustment, either as a string, or the result of
a call to a position adjustment function.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them.}

\item{bandwidth}{Bandwidth used for density calculation. If not provided, is estimated from the data.}

\item{from, to}{The left and right-most points of the grid at which the density is to be estimated,
as in \code{\link[=density]{density()}}. If not provided, there are estimated from the data range and the bandwidth.}

\item{calc_ecdf}{If \code{TRUE}, \code{stat_density_ridges} calculates an empirical cumulative distribution function (ecdf)
and returns a variable \code{ecdf} and a variable \code{quantile}. Both can be mapped onto aesthetics via
\code{..ecdf..} and \code{..quantile..}, respectively.}

\item{quantiles}{Sets the number of quantiles the data should be broken into if \code{calc_ecdf = TRUE}.
If it is an integer then the data will be cut into that many equal quantiles.
If it is a vector of probabilities then the ecdf will cut by them.}

\item{...}{other arguments passed on to \code{\link[=layer]{layer()}}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{color = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}
}
\description{
This stat is the default stat used by \code{\link{geom_density_ridges}}. It is very similar to \code{\link{stat_density}},
however there are a few differences. Most importantly, the density bandwidth is chosen across
the entire dataset.
}
\examples{
# Examples of coloring by ecdf or quantiles
library(viridis)
ggplot(iris, aes(x=Sepal.Length, y=Species, fill=factor(..quantile..))) +
  geom_density_ridges_gradient(calc_ecdf = TRUE, quantiles = 5) +
  scale_fill_viridis(discrete = TRUE, name = "Quintiles") + theme_ridges() +
  scale_y_discrete(expand = c(0.01, 0))

ggplot(iris, aes(x=Sepal.Length, y=Species, fill=0.5 - abs(0.5-..ecdf..))) +
  geom_density_ridges_gradient(calc_ecdf = TRUE) +
  scale_fill_viridis(name = "Tail probability", direction = -1) + theme_ridges() +
  scale_y_discrete(expand = c(0.01, 0))

ggplot(iris, aes(x=Sepal.Length, y=Species, fill=factor(..quantile..))) +
  geom_density_ridges_gradient(calc_ecdf = TRUE, quantiles = c(0.05, 0.95)) +
  scale_fill_manual(name = "Probability\\nranges",
                    values = c("red", "grey80", "blue")) +
  theme_ridges() + scale_y_discrete(expand = c(0.01, 0))

}
\keyword{datasets}
