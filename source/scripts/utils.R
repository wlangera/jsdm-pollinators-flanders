# Function to count categories in a list of dataframes
count_unique_cats <- function(df_list, col_name) {
  table(unlist(sapply(df_list, function(df) df[[col_name]])))
}

# Function to check if value is informative (i.e., not in exclusion list)
is_informative <- function(x, exclusions) {
  !is.na(x) & !(x %in% exclusions)
}
