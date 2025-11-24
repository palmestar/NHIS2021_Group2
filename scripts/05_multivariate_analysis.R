# Day 4 Task 1 

# Load required libraries 
library(tidyverse) # Data for wrangling and visualization
install.packages("psych") # Data for matrix correlation
library(psych)
library(ggplot2) # Data for plotting
nhis_clean <- read_csv("data/nhis_clean.csv")

# Create output folder
dir.create("plots", showWarnings = FALSE) # Prevents saving output in an already existing folder

# Scatter plot Height vs Weight
ggplot(nhis_clean, aes(x = HEIGHTTC_A, y = WEIGHTLBTC_A, color = SEX_A)) +
  geom_point() +
  facet_wrap(~EDUCP_A_recoded) + # You can switch to PHSTAT_A instead
  labs(
    title = "Height vs Weight by Sex and Education",
    x = "Height",
    y = "Weight"
  )

# Save scatter plot
    ggsave("plots/day4_scatter.png")

# Correlation scatter plot matrix
pairs.panels(
  nhis_clean %>% select(AGEP_A, WEIGHTLBTC_A, HEIGHTTC_A)
)
