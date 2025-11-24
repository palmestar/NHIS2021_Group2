# Day 3 Task 1

#--- Run summary statistics for age, weight, and height

summary(AGEP_A, WEIGHTLBTC_A, HEIGHTTC_A)

install.packages("modeest")
library(modeest)

summary(AGEP_A)
sd(AGEP_A)
mfv(AGEP_A)

summary(WEIGHTLBTC_A)
sd(WEIGHTLBTC_A)
mfv(WEIGHTLBTC_A)

summary(HEIGHTTC_A)
sd(HEIGHTTC_A)
mfv(HEIGHTTC_A)


#--- Create base R histogram for age, weight, and height


hist(AGEP_A)

hist(WEIGHTLBTC_A)

hist(HEIGHTTC_A)


#--- Create ggplot2 histogram for age, weight, and height


ggplot(nhis_clean_1_, aes(x=AGEP_A)) +
  geom_histogram(binwidth=2, fill="steelblue", color="black") +
  ggtitle("Histogram of Age") +
  xlab("Age") +
  ylab("Count")

ggplot(nhis_clean_1_, aes(x=WEIGHTLBTC_A)) +
  geom_histogram(binwidth=2, fill="steelblue", color="black") +
  ggtitle("Histogram of WEIGHT") +
  xlab("WEIGHT") +
  ylab("Count")

ggplot(nhis_clean_1_, aes(x=HEIGHTTC_A)) +
  geom_histogram(binwidth=2, fill="steelblue", color="black") +
  ggtitle("Histogram of HEIGHT") +
  xlab("HEIGHT") +
  ylab("Count")


#---Create base R boxplot for age, weight, and height


boxplot(AGEP_A)

boxplot(WEIGHTLBTC_A)

boxplot(HEIGHTTC_A)


#--- Create ggplot2 boxplot for age, weight, and height


ggplot(nhis_clean_1_, aes(y = AGEP_A)) + 
  geom_boxplot(fill = "pink") + 
  scale_x_discrete() +
  labs(title = "Boxplot of Age",
       y = "HEIGHT Count")

ggplot(nhis_clean_1_, aes(y = WEIGHTLBTC_A)) + 
  geom_boxplot(fill = "pink") + 
  scale_x_discrete() +
  labs(title = "Boxplot of WEIGHT",
       y = "HEIGHT Count")

ggplot(nhis_clean_1_, aes(y = HEIGHTTC_A)) + 
  geom_boxplot(fill = "pink") + 
  scale_x_discrete() +
  labs(title = "Boxplot of HEIGHT",
       y = "HEIGHT Count")


#--- Create frequency tables for gender, race/ethnicity, education, general health status, and quality of life

table(nhis_clean_1_$SEX_A)

table(nhis_clean_1_$HISPALLP_A)

table(nhis_clean_1_$EDUCP_A)

table(nhis_clean_1_$PHSTAT_A)

table(nhis_clean_1_$LSATIS4R_A)

vars <- c("SEX_A", "HISPALLP_A", "EDUCP_A", "PHSTAT_A", "LSATIS4R_A")

lapply(nhis_clean_1_[vars], table)


#--- Create bar plot for gender, race/ethnicity, education, health status, and  quality of life


counts <- table(nhis_clean_1_$SEX_A)

barplot(counts,
        main = "Distribution of SEX_A",
        xlab = "Gender",
        ylab = "Frequency",
        col = "skyblue",
        las = 2) 

counts <- table(nhis_clean_1_$HISPALLP_A)

barplot(counts,
        main = "Distribution of Race/Ethnicity",
        xlab = "Race/Ethnicity",
        ylab = "Frequency",
        col = "skyblue",
        las = 2) 

counts <- table(nhis_clean_1_$EDUCP_A)

barplot(counts,
        main = "Distribution of Education",
        xlab = "Education Level",
        ylab = "Frequency",
        col = "skyblue",
        las = 2) 

counts <- table(nhis_clean_1_$PHSTAT_A)

barplot(counts,
        main = "Distribution of General Health Status",
        xlab = "Health Status",
        ylab = "Frequency",
        col = "skyblue",
        las = 2) 

counts <- table(nhis_clean_1_$LSATIS4R_A)

barplot(counts,
        main = "Distribution of Quality of Life",
        xlab = "Quality of Life",
        ylab = "Frequency",
        col = "skyblue",
        las = 2) 

#--- Create ggplot2 barplot for gender, race/ethnicity, education, health status, and  quality of life


ggplot(nhis_clean_1_, aes(x=factor(SEX_A))) +
  geom_bar(fill="tomato", color="black") +
  ggtitle("Bar Plot of Gender") +
  xlab("Gender") +
  ylab("frequency") 

ggplot(nhis_clean_1_, aes(x=factor(HISPALLP_A))) +
  geom_bar(fill="tomato", color="black") +
  ggtitle("Bar Plot of Race/Ethnicity") +
  xlab("Race/Ethnicity") +
  ylab("frequency") 

ggplot(nhis_clean_1_, aes(x=factor(EDUCP_A))) +
  geom_bar(fill="tomato", color="black") +
  ggtitle("Bar Plot of Education") +
  xlab("Education") +
  ylab("frequency") 

ggplot(nhis_clean_1_, aes(x=factor(PHSTAT_A))) +
  geom_bar(fill="tomato", color="black") +
  ggtitle("Bar Plot of General Health Status") +
  xlab("General Health Status") +
  ylab("frequency") 

ggplot(nhis_clean_1_, aes(x=factor(LSATIS4R_A))) +
  geom_bar(fill="tomato", color="black") +
  ggtitle("Bar Plot of Quality of Life") +
  xlab("Quality of Life") +
  ylab("frequency") 









