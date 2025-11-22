# Day 4 Task 1 

# Load libraries 
library(tidyverse)
install.packages("psych")
library(psych)
library(ggplot2)
nhis_clean <- read_csv("data/nhis_clean.csv")

# Create folder
dir.create("plots", showWarnings = FALSE)

# Scatterplot
ggplot(nhis_clean, aes(x = HEIGHTTC_A, y = WEIGHTLBTC_A, color = SEX_A)) +
  geom_point() +
  facet_wrap(~EDUCP_A_recoded) + # You can switch to PHSTAT_A instead
  labs(
    title = "Height vs Weight by Sex and Education",
    x = "Height",
    y = "Weight"
  )

    ggsave("plots/day4_scatter.png")

# Correlation scatterplot matrix
pairs.panels(
  nhis_clean %>% select(AGEP_A, WEIGHTLBTC_A, HEIGHTTC_A)
)