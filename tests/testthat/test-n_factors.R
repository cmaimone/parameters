if (require("testthat") && require("parameters")) {
  test_that("n_factors", {
    set.seed(333)
    x <- n_factors(mtcars[, 1:4])
    testthat::expect_equal(ncol(x), 3)
  })
}
