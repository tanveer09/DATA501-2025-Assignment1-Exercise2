#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double my_function_A(NumericVector x) {
  int n = x.size();
  if (n < 2) {
    Rcpp::stop("Need at least two elements to compute sample variance");
  }

  double mean = Rcpp::mean(x);
  double sum_sq_diff = 0.0;

  for (int i = 0; i < n; ++i) {
    sum_sq_diff += (x[i] - mean) * (x[i] - mean);
  }

  return sum_sq_diff / (n - 1);
}
