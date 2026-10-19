library(testthat)
library(ggplot2)

test_data_plot <- data.frame(
  experimental_group = c("CTR", "TRT"),
  center_perc = c(15, 50),
  rearing_perc = c(5, 20)
)

test_that("plot_oft successfully generates a ggplot object", {

  my_plot <- plot_oft(test_data_plot, y_col = "center_perc")

  expect_true(is_ggplot(my_plot))

})

test_that("plot_oft identifies absence of fundamental columns", {

  bad_group_data <- data.frame(
    wrong_name = c("CTR", "TRT"),
    center_perc = c(15, 50)
  )
  expect_error(plot_oft(bad_group_data, y_col = "center_perc"), "column 'experimental_group' not found")

  expect_error(plot_oft(test_data_plot, y_col = "fake_column"), "the selected y_col does not exist")

})