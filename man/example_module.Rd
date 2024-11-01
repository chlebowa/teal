% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dummy_functions.R
\name{example_module}
\alias{example_module}
\title{An example \code{teal} module}
\usage{
example_module(
  label = "example teal module",
  datanames = "all",
  transformers = list()
)
}
\arguments{
\item{label}{(\code{character(1)}) Label shown in the navigation item for the module or module group.
For \code{modules()} defaults to \code{"root"}. See \code{Details}.}

\item{datanames}{(\code{character}) Names of the datasets relevant to the item.
There are 2 reserved values that have specific behaviors:
\itemize{
\item The keyword \code{"all"} includes all datasets available in the data passed to the teal application.
\item \code{NULL} hides the sidebar panel completely.
\item If \code{transformers} are specified, their \code{datanames} are automatically added to this \code{datanames}
argument.
}}

\item{transformers}{(\code{list} of \code{teal_data_module}) that will be applied to transform the data.
Each transform module UI will appear in the \code{teal}'s sidebar panel.
Transformers' \code{datanames} are added to the \code{datanames}. See \code{\link[=teal_transform_module]{teal_transform_module()}}.}
}
\value{
A \code{teal} module which can be included in the \code{modules} argument to \code{\link[=init]{init()}}.
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}
}
\examples{
app <- init(
  data = teal_data(IRIS = iris, MTCARS = mtcars),
  modules = example_module()
)
if (interactive()) {
  shinyApp(app$ui, app$server)
}
}
