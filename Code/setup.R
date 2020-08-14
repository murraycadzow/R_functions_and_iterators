# Install required packages
if (!require(tidyverse)) {
  install.packages("tidyverse")
}

if (!require(here)) {
  install.packages("here")
}

if (!require(janitor)) {
  install.packages("janitor")
}

if (!require(palmerpenguins)) {
  install.packages("palmerpengiuns")
}

if (!file.exists(here::here("Data/"))) {
  dir.create("Data/")
}

# Create the data sets

islands <- unique(palmerpenguins::penguins_raw$Island)

create_island_file <- function(island_name){
  palmerpenguins::penguins_raw %>%
    dplyr::filter(Island == island_name) %>%
    readr::write_csv(path = here::here("Data/",stringr::str_c(tolower(island_name),".csv")))
}

purrr::walk(islands, create_island_file)


