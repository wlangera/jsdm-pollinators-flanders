get_base <- function(file_name) {
  require("stringr")

  nm <- basename(file_name)

  nm |>                                          # start with file name only
    str_remove("^INBODATAVR-\\d+_") |>           # drop the leading code
    str_remove("_sowieso\\.csv$|\\.csv$") |>     # drop the tail
    str_remove("(Pre|Post)?\\d{4}(-\\d{4})?") |> # strip year tags
    # group both under “libellen” and "dagvlinders"
    str_replace_all("echte_libellen|juffers", "libellen") |>
    str_replace("^dagvlinders.*", "dagvlinders") |>
    str_replace_all("_+$", "")                   # tidy trailing underscores
}
