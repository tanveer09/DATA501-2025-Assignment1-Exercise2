#' @useDynLib t4stats, .registration = TRUE
#' @importFrom Rcpp sourceCpp
NULL

#' mean_R
#'
#' Mean calculated using R
#'
#' @param x numeric vector
#' @return numeric
#' @export
mean_R <- function(x) {
  if (!is.numeric(x)) {
    stop("`x` must be a numeric vector. Please provide numeric input values.", call. = FALSE)
  }
  mean(x)
}

#' variance_R
#'
#' Variance calculated using R
#'
#' @param x numeric vector
#' @return numeric
#' @export
variance_R <- function(x) {
  if (!is.numeric(x)) {
    stop("`x` must be a numeric vector. Please provide numeric input values.", call. = FALSE)
  }
  stats::var(x)
}

#' run_all
#'
#' Print all four results (A variance function in C++, B mean function in C++, mean in R, variance in R)
#'
#' @param x numeric vector
#' @return (invisible) list of results
#' @examples
#' run_all(c(1,2,3,4))
#' @export
run_all <- function(x) {
  if (!is.numeric(x)) {
    stop("`x` must be a numeric vector. Please provide numeric input values.", call. = FALSE)
  }

  A <- my_function_A(x)  # C++: variance
  B <- my_function_B(x)  # C++: mean
  M <- mean_R(x)             # R: mean
  V <- variance_R(x)         # R: variance

  # match the assignment's print style
  print(paste("Function A Results: ",  A))
  print(paste("Function B Results: ",  B))
  print(paste("Mean:  ",              M))
  print(paste("Variance:  ",          V))

  invisible(list(A = A, B = B, Mean = M, Variance = V))
}
