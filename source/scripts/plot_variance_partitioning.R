plot_variance_partitioning <- function(gllvm_model) {
  require("ggplot2")
  require("dplyr")
  require("rlang")

  var_part <- gllvm::varPartitioning(gllvm_model)
  var_part$PropExplainedVarSp %>%
    as_tibble(rownames = "species") %>%
    tidyr::pivot_longer(
      -"species", names_to = "part", values_to = "percentage"
    ) %>%
    mutate(
      Legend = factor(
        paste0(
          gsub("/", "\n", .data$part),
          "\n-->mean: ",
          round(colMeans(var_part$PropExplainedVarSp), 3)
        ),
      )
    ) %>%
    ggplot(aes(x = .data$species, y = .data$percentage, fill = .data$Legend)) +
    geom_bar(stat = "identity") +
    labs(x = "", y = "Variance proportion") +
    theme_minimal() +
    theme(
      legend.position = "bottom",
      legend.text = element_text(size = 8),
      axis.text.x = element_text(
        size = 7, angle = 90, hjust = 0.95, vjust = 0.2
      )
    )
}
