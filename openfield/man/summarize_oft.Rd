\name{summarize_oft}
\alias{summarize_oft}
\title{Summarize Open Field Test Percentages}

\description{
  Groups behavioral percentages by "experimental_group" and calculates the number of animals, average (mean), standard deviation (SD), and Standard Error of the Mean (SEM) for center, periphery, freezing, and rearing percentages.
  It can be used on the output of score_oft() or on a custom data frame, as long as the required column names match.
}

\usage{
  summarize_oft(data)
}

\arguments{
  \item{data}{A data frame containing an "experimental_group" column and percentage columns (center_perc, periphery_perc, freezing_perc, rearing_perc).}
}

\value{
  A summary data frame grouped by "experimental_group" containing:
  "animal_number",
  "average_center_perc", "average_periphery_perc", "average_freezing_perc", "average_rearing_perc",
  "sd_center_perc", "sd_periphery_perc", "sd_freezing_perc", "sd_rearing_perc",
  "sem_center_perc", "sem_periphery_perc", "sem_freezing_perc", and "sem_rearing_perc".
}

\examples{
  # APPROACH 1: using the function summarize_oft() after score_oft (recommended):
  raw_data <- data.frame(
    experimental_group = c("CTR", "CTR", "TRT", "TRT"),
    center_time = c(30, 25, 80, 90),
    periphery_time = c(250, 260, 180, 190),
    freezing_time = c(10, 15, 5, 2),
    rearing_time = c(12, 10, 25, 30)
  )

  scored_data <- score_oft(raw_data, total_time = 300)
  summarize_oft(scored_data)


  # APPROACH 2: using a custom data frame directly
  # TIP FOR BIOLOGISTS: you can use your own data directly if you
  # already calculated the percentages. Just make sure your CSV file
  # has columns named exactly like the ones below!

  my_custom_data <- data.frame(
     experimental_group = c("Naive", "Naive", "Stressed", "Stressed"),
     center_perc = c(10, 14, 4, 6),
     periphery_perc = c(80, 76, 84, 86),
     freezing_perc = c(5, 5, 10, 6),
     rearing_perc = c(5, 5, 2, 2)
  )
  summarize_oft(my_custom_data)
}
