library(testthat)

test_data_summary <- data.frame(
  experimental_group = c("CTR", "CTR", "TRT", "TRT"),
  center_perc = c(10, 20, 40, 60),
  periphery_perc = c(80, 70, 50, 30),
  freezing_perc = c(5, 5, 0, 0),
  rearing_perc = c(5, 15, 20, 30)
)

test_that("summarize_oft calculates correct means and SEM", {

  result <- summarize_oft(test_data_summary)

  expect_equal(result$average_center_perc, c(15, 50))

  expect_equal(result$sem_center_perc, c(5, 10))

})

test_that("summarize_oft catches missing experimental_group column", {

  bad_data <- data.frame(
    wrong_group_name = c("CTR", "TRT"),
    center_perc = c(15, 50)
  )

  expect_error(summarize_oft(bad_data), "the dataframe must contain a column named 'experimental_group'")

})