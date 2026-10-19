score_oft <- function(data, total_time = 300) {

  if (total_time <= 0) {
    stop("Total time must be greater than 0")

  } else if (!is.numeric(data$center_time)) {
    stop("Error: 'center_time' column contains text. It must be strictly numeric.")

  } else if (!is.numeric(data$periphery_time)) {
    stop("Error: 'periphery_time' column contains text. It must be strictly numeric.")

  } else if (!is.numeric(data$freezing_time)) {
    stop("Error: 'freezing_time' column contains text. It must be strictly numeric.")

  } else if (!is.numeric(data$rearing_time)) {
    stop("Error: 'rearing_time' column contains text. It must be strictly numeric.")

  } else if (any(data$center_time < 0)) {
    stop("Center times cannot be negative")

  } else if (any(data$periphery_time < 0)) {
    stop("Periphery times cannot be negative")

  } else if (any(data$freezing_time < 0)) {
    stop ("Freezing times cannot be negative")

  } else if (any(data$rearing_time < 0)) {
    stop("Rearing times cannot be negative")

  } else{
    updated_table <- data |>
      mutate(
        center_perc = (center_time / total_time) * 100,
        periphery_perc = (periphery_time / total_time) * 100,
        freezing_perc = (freezing_time / total_time) * 100,
        rearing_perc = (rearing_time / total_time) * 100
      )

    return(updated_table)
  }
}

