plot_oft <- function(data, y_col = "center_perc") {

  if (!("experimental_group" %in% colnames(data))) {
    stop("Error: column 'experimental_group' not found")

  } else if (!(y_col %in% colnames(data))) {
    stop("Error: the selected y_col does not exist in the provided dataframe ")
    
  } else {

   my_plot <- ggplot(data, aes(x = experimental_group, y = .data[[y_col]], fill = experimental_group)) +

    stat_summary(fun = mean, geom = "bar", color = "black", alpha = 0.8, width = 0.6) +

    stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2, color = "black") +

    geom_jitter(width = 0.15, size = 2, color = "black", alpha = 0.8) +

    scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +

    theme_classic() +
    labs(
      title = paste("OFT:", y_col),
      x = "Experimental group",
      y = y_col
    ) +

    theme(
      plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
      legend.position = "none",
      axis.text = element_text(color = "black", size = 12),
      axis.title = element_text(color = "black", size = 14)
    )

  return(my_plot)
 }

  }

