\name{plot_oft}
\alias{plot_oft}
\title{Plot Open Field Test Results}

\description{
  Generates a bar plot showing the group mean, Standard Error of the Mean (SEM) error bars, and individual animal data points (jitter) for a selected Open Field Test percentage column.
  TIP FOR BIOLOGISTS: this function returns a standard ggplot2 object, but you can easily customize the plot further by adding extra layers (like custom colors, themes, or new titles) using the '+' operator!
}

\usage{
  plot_oft(data, y_col = "center_perc")
}

\arguments{
  \item{data}{A data frame containing an "experimental_group" column and the behavioral percentage column specified in y_col (typically the output of score_oft()).}
  \item{y_col}{A character string indicating the column name to plot on the y-axis (i.e., "center_perc", "periphery_perc", "freezing_perc", or "rearing_perc"). The default is "center_perc".}
}

\value{
  A ggplot object representing the bar plot with SEM error bars and individual jittered points.
}

\examples{
  raw_data <- data.frame(
    experimental_group = c("CTR", "CTR", "TRT", "TRT"),
    center_time = c(30, 25, 80, 90),
    periphery_time = c(250, 260, 180, 190),
    freezing_time = c(10, 15, 5, 2),
    rearing_time = c(12, 10, 25, 30)
  )

  scored_data <- score_oft(raw_data, total_time = 300)

  # 1. Default plot (center_perc)
  plot_oft(scored_data)

  # 2. Plot a different parameter (e.g., rearing percentage)
  plot_oft(scored_data, y_col = "rearing_perc")

  # 3. Customizing the plot for a presentation or paper:
  # (you can override titles or add custom colors using standard ggplot layers)
  # my_custom_plot <- plot_oft(scored_data, y_col = "center_perc") +
  #   labs(title = "Anxiolytic Effect of Compound X", y = "% Time in Center Arena") +
  #   scale_fill_manual(values = c("CTR" = "gray70", "TRT" = "forestgreen"))
  # print(my_custom_plot)
}
