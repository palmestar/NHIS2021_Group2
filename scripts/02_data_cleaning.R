# Day 2 Tasks 1 & 2

library(tidyverse)

# Load data
setwd("~/Downloads")
getwd()
list.files()
nhis <- read_csv("NHIS _Data_2021.csv")                                                                                                                                                                                                                              

# Check data
glimpse(nhis)
summary(nhis)

# Sort variables
nhis_selected <- nhis %>%
  select(AGEP_A, WEIGHTLBTC_A, HEIGHTTC_A, SEX_A, HISPALLP_A, EDUCP_A, PHSTAT_A, LSATIS4R_A)

# Define
missing_codes <- c(7, 9, 97, 98, 99, 996, 997, 998, 999)

# Dataset
ls()
names(nhis)

# Create variable
nhis_selected <- nhis %>%
  select(
    AGEP_A, WEIGHTLBTC_A, HEIGHTTC_A, SEX_A, HISPALLP_A, EDUCP_A, PHSTAT_A, LSATIS4R_A
  )
head(nhis_selected)

# Remove rows
nhis_clean_task1 <- nhis_selected %>%
  filter(!(
    AGEP_A %in% missing_codes |
      WEIGHTLBTC_A %in% missing_codes |
      HEIGHTTC_A %in% missing_codes |
      SEX_A %in% missing_codes |
      HISPALLP_A %in% missing_codes |
      EDUCP_A %in% missing_codes |
      PHSTAT_A %in% missing_codes |
      LSATIS4R_A %in% missing_codes
  ))

# Check rows
nrow(nhis_selected)
nrow(nhis_clean_task1)

# Recode
nhis_clean <- nhis_clean_task1 %>%
  mutate(
    EDUCP_A_recoded = case_when(
      EDUCP_A %in% 0:4 ~"Less than High School",
      EDUCP_A == 4 ~ "High School Graduate",
      EDUCP_A %in% 5:7 ~ "Some College Education",
      EDUCP_A %in% 8:10 ~ "College Graduate or better",
      TRUE ~ NA_character_ 
    )
  )

# Convert 
nhis_clean$EDUCP_A_recoded <- factor(
  nhis_clean$EDUCP_A_recoded,
  levels = c(
    "Less than High School", 
    "High School Graduate", 
    "Some College Education", 
    "College Graduate or better"
  )
)

# Check counts
table(nhis_clean$EDUCP_A_recoded)

# Save data
dir.create("data", showWarnings = FALSE)
write_csv(nhis_clean, "data/nhis_clean.csv")

# Save content
list.files("data")

write.csv(nhis_clean, "nhis_clean.csv", row.names = FALSE)
getwd()