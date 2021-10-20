library(tidyverse)

pumpkin_raw <- read_csv("pumpkins.csv")

pumpkins <- pumpkin_raw %>%
  separate(id, into = c("year", "id")) %>%
  filter(!str_detect(country, ",")) %>%
  mutate(weight_lbs = as.numeric(weight_lbs))

pumpkins |> count(country) |> ggplot() + geom_col(mapping = aes(y=reorder(country, n), x=n, fill=country))