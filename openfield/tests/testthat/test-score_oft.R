library("testthat")

test_data <- data.frame(
  center_time = c(30, 60),
  periphery_time = c(240, 210),
  freezing_time = c(15, 0),
  rearing_time = c(15, 30)
  )

test_that("score_oft correctly calculates mathematical percentages", {

  result <- score_oft(test_data, total_time = 300)

    expect_equal(result$center_perc, c(10, 20))
    expect_equal(result$periphery_perc, c(80, 70))
    expect_equal(result$freezing_perc, c(5, 0))
    expect_equal(result$rearing_perc, c(5, 10))

})

test_that("score_oft correctly blocks invalida data", {

string_data <- data.frame(
  center_time = c("missed", 20),
  periphery_time = c(250, 260),
  freezing_time = c(10, 15),
  rearing_time = c(15, 30)
  )

  expect_error(score_oft(string_data, total_time = 300), "must be strictly numeric")

  negative_data <- data.frame(
    center_time = c(30, -15),
    periphery_time = c(240, 210),
    freezing_time = c(15, 0),
    rearing_time = c(15, 30)
  )
  expect_error(score_oft(negative_data, total_time = 300), "cannot be negative")

})
