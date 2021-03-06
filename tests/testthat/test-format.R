if (require("testthat") && require("parameters")) {
  test_that("format_p", {
    testthat::expect_equal(nchar(format_p(0.02)), 9)
    testthat::expect_equal(nchar(format_p(0.02, stars = TRUE)), 10)
    testthat::expect_equal(nchar(format_p(0.02, stars_only = TRUE)), 1)
  })

  test_that("format_number and format_order", {
    testthat::expect_equal(format_number(2), "two")
    testthat::expect_equal(format_number(45), "forty five")
    testthat::expect_equal(format_number(2), "two")

    testthat::expect_equal(format_order(2), "second")
    testthat::expect_equal(format_order(45), "forty fifth")

    testthat::expect_equal(format_order(2, textual = FALSE), "2nd")
    testthat::expect_equal(format_order(45, textual = FALSE), "45th")
  })


  test_that("format others", {
    testthat::expect_true(is.character(format_pd(0.02)))
    testthat::expect_equal(nchar(format_bf(4)), 9)
    testthat::expect_true(is.character(format_rope(0.02)))
  })
}
