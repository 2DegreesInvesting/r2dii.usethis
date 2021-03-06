library(dplyr)
library(r2dii.data)
library(usethis)

picked <- c(
  "advanced economies",
  "caspian",
  "developing asia",
  "europe",
  "global"
)

region_isos_demo <- r2dii.data::region_isos %>%
  filter(source == "weo_2019") %>%
  mutate(source = "demo_2020") %>%
  filter(.data$region %in% picked)

length_ok <- identical(length(unique(region_isos_demo$region)), length(picked))
stopifnot(length_ok)

usethis::use_data(region_isos_demo, overwrite = TRUE)
