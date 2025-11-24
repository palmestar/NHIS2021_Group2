# Day 2 Tasks 1 & 2

# Load library data for visualization and wrangling
library(tidyverse)

# Load data to be stored within the current file
setwd("~/Downloads") # Data will be stored here
getwd() # Working directory
list.files() # List files
nhis <- read_csv("NHIS _Data_2021.csv") # NHIS dataset                                                                                                                                                                                                                             

# Check data
glimpse(nhis) # Quick look at data
summary(nhis) # Description of variables

# Sort variables for analysis
nhis_selected <- nhis %>%
  select(AGEP_A, WEIGHTLBTC_A, HEIGHTTC_A, SEX_A, HISPALLP_A, EDUCP_A, PHSTAT_A, LSATIS4R_A)

# Define missing or invalid code
missing_codes <- c(7, 9, 97, 98, 99, 996, 997, 998, 999)

# Check data set variables and environment 
ls()
names(nhis)

# Clean data 
nhis_selected <- nhis %>%
  select(
    AGEP_A, WEIGHTLBTC_A, HEIGHTTC_A, SEX_A, HISPALLP_A, EDUCP_A, PHSTAT_A, LSATIS4R_A
  )
head(nhis_selected)

# Remove unnecessary data 
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

# Recode variables
nhis_clean <- nhis_clean_task1 %>%
  mutate(
    EDUCP_A_recoded = case_when(
      EDUCP_A %in% 0:3 ~"Less than High School",
      EDUCP_A == 4 ~ "High School Graduate",
      EDUCP_A %in% 5:7 ~ "Some College Education",
      EDUCP_A %in% 8:10 ~ "College Graduate or better",
      TRUE ~ NA_character_ 
    )
  )

# Convert the recoded data in order
nhis_clean$EDUCP_A_recoded <- factor(
  nhis_clean$EDUCP_A_recoded,
  levels = c(
    "Less than High School", 
    "High School Graduate", 
    "Some College Education", 
    "College Graduate or better"
  )
)

# Check frequency of education
table(nhis_clean$EDUCP_A_recoded)

# Create folder and clean data
dir.create("data", showWarnings = FALSE)
write_csv(nhis_clean, "data/nhis_clean.csv")

# Save content
list.files("data")

# Save a copy
write.csv(nhis_clean, "nhis_clean.csv", row.names = FALSE)
getwd()
