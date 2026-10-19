\name{score_oft}
\alias{score_oft}
\title{Score Open Field Test Raw Data}

\description{
  Calculates behavioral percentages (center, periphery, freezing, rearing) from raw Open Field Test data in seconds.
}

\usage{
  score_oft(data, total_time = 300)
}

\arguments{
  \item{data}{A data frame containing the raw OF test times in seconds. IMPORTANT: the data frame MUST contain columns named exactly: "center_time", "periphery_time", "freezing_time", and "rearing_time".}
  \item{total_time}{The total duration of the test in seconds. The default is 300 seconds (5 min).}
}

\value{
  A data frame with the original columns plus the calculated percentages (center_perc, periphery_perc, freezing_perc, rearing_perc).
}

\examples{
  # TIP FOR BIOLOGISTS:

  # To analyze your real data, import your CSV file first using the command in the fourth line from here.
  # (Make SURE that your Excel/CSV column headers are exactly:
  # center_time, periphery_time, freezing_time, rearing_time)
  # my_real_data <- read.csv("my_open_field_data.csv")

  # Then analyze data launching the function:
  # score_oft(my_real_data, total_time = 300)


   # Example with mock data (to test the function):
  my_data <- data.frame(
    center_time = c(30, 60),
    periphery_time = c(240, 210),
    freezing_time = c(15, 0),
    rearing_time = c(15, 30)
  )

  score_oft(my_data, total_time = 300)
}
