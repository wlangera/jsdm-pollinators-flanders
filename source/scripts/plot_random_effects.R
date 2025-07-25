plot_random_effects <- function(gllvm_model) {
  estimates <- gllvm_model$params$Br[-1, ] %>%
    as_tibble(rownames = "param") %>%
    pivot_longer(-param, names_to = "species", values_to = "estimate")

  ses_gllvm_model <- gllvm::getPredictErr(gllvm_model)$Br[-1, ] %>%
    as_tibble(rownames = "param") %>%
    pivot_longer(-param, names_to = "species", values_to = "se")

  full_join(estimates, ses_gllvm_model, by = join_by(param, species)) %>%
    mutate(order = mean(estimate), .by = "species") %>%
    mutate(
      lcl = estimate + qnorm(0.025) * se,
      ucl = estimate + qnorm(0.975) * se,
      significant = !(0 > lcl & 0 < ucl),
      species = reorder(species, order)
    ) %>%
    ggplot(aes(x = estimate, y = species, colour = param, alpha =  significant)) +
    geom_vline(xintercept = 0, linetype = "dashed", colour = "darkgrey") +
    geom_point(position = position_dodge(width = 0.8)) +
    geom_errorbar(aes(xmin = lcl, xmax = ucl),
                  position = position_dodge(width = 0.8)) +
    labs(x = "compared to dry heather", y = "", colour = "Legend:") +
    theme_minimal() +
    guides(alpha = "none") +
    scale_alpha_manual(values = c(0.2, 1)) +
    theme(legend.position = "inside",
          legend.position.inside = c(0.8, 0.15),
          legend.background = element_rect(fill = "white"),
          axis.text.y = element_text(size = 6))
}
