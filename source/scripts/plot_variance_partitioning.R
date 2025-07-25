plot_variance_partitioning <- function(gllvm_model) {
  var_part <- varPartitioning(gllvm_model)
  var_part$PropExplainedVarSp %>%
    as_tibble(rownames = "species") %>%
    pivot_longer(-species, names_to = "part", values_to = "percentage") %>%
    mutate(
      Legend = factor(
        paste0(
          gsub("/", "\n", part),
          "\n-->mean: ",
          round(colMeans(var_part$PropExplainedVarSp), 3)
        ),
      )
    ) %>%
    ggplot(aes(x = species, y = percentage, fill = Legend)) +
    geom_bar(stat = "identity") +
    labs(x = "", y = "Variance proportion") +
    theme_minimal() +
    theme(
      legend.position = "bottom",
      legend.text = element_text(size = 8),
      axis.text.x = element_text(size = 7, angle = 90, hjust = 0.95, vjust = 0.2)
    )
}
