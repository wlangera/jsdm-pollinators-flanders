plot_trait_parameters <- function(gllvm_model, alpha = 0.05) {
  require("ggplot2")
  require("dplyr")
  require("tidyr")
  require("rlang")

  # Extract estimates
  fourth <- gllvm:::getFourthCorner(gllvm_model)

  # Extract standard errors
  gllvm_modeltemp <- gllvm_model
  gllvm_modeltemp$params$B <- gllvm_model$sd$B
  sds <- gllvm:::getFourthCorner(gllvm_modeltemp) # Trick to get SEs

  # Compute confidence intervals
  lcl <- t(fourth + sds * qnorm(alpha / 2))
  ucl <- t(fourth + sds * qnorm(1 - alpha / 2))

  # Identify cells with significant effects (CI does not cross zero)
  sig <- (lcl > 0 & ucl > 0) | (lcl < 0 & ucl < 0)

  # Prepare tidy dataframe for ggplot
  fourth_df <- as.data.frame(fourth)
  fourth_df$Environment <- rownames(fourth)
  fourth_df_long <- fourth_df %>%
    pivot_longer(cols = -"Environment", names_to = "Trait",
                 values_to = "Estimate")

  df_sig <- as.data.frame(sig)
  df_sig$Trait <- rownames(sig)
  df_sig_long <- df_sig %>%
    pivot_longer(cols = -"Trait", names_to = "Environment",
                 values_to = "Significant")

  plot_df <- left_join(fourth_df_long, df_sig_long,
                       by = c("Environment", "Trait"))

  # For consistent color scaling
  a <- max(abs(plot_df$Estimate), na.rm = TRUE)

  ggplot(plot_df, aes(y = .data$Trait, x = .data$Environment,
                      fill = .data$Estimate)) +
    geom_tile(color = "grey80") +
    scale_fill_gradient2(
      low = "#E69F00", mid = "white", high = "#009E73",
      midpoint = 0, limits = c(-a, a)
    ) +
    geom_tile(
      data = filter(plot_df, .data$Significant),
      color = "black", linewidth = 2, fill = NA
    ) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      panel.grid = element_blank()
    ) +
    labs(y = "Trait", x = "Environment", fill = "Estimate")
}
