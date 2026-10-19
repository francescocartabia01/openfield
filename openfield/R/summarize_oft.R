summarize_oft <- function(data) {

  if (!("experimental_group" %in% colnames(data))) {
    stop("Error: the dataframe must contain a column named 'experimental_group'")

  } else{

    calculated_data <- data |>
    group_by(experimental_group) |>
      summarize(
                animal_number = n(),

                average_center_perc = mean(center_perc, na.rm = TRUE),
                average_periphery_perc = mean(periphery_perc, na.rm = TRUE),
                average_freezing_perc = mean(freezing_perc, na.rm = TRUE),
                average_rearing_perc = mean(rearing_perc, na.rm = TRUE),

                sd_center_perc = sd(center_perc, na.rm = TRUE),
                sd_periphery_perc = sd(periphery_perc, na.rm = TRUE),
                sd_freezing_perc = sd(freezing_perc, na.rm = TRUE),
                sd_rearing_perc = sd(rearing_perc, na.rm = TRUE),

                sem_center_perc = sd_center_perc / sqrt(animal_number),
                sem_periphery_perc = sd_periphery_perc / sqrt(animal_number),
                sem_freezing_perc = sd_freezing_perc / sqrt(animal_number),
                sem_rearing_perc = sd_rearing_perc / sqrt(animal_number)
                )

  return(calculated_data)
  }
}
