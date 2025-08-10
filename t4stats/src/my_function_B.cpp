#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double my_function_B(NumericVector x) {
  int n = x.size();
  if (n < 2) {
    Rcpp::stop("Need at least two elements to compute the mean");
  }
  double sum_total = 0;

  for (int i = 0; i < n; ++i) {
    sum_total += x[i];
  }

  return sum_total / n;
}
