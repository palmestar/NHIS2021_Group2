#Day 3 Task 2

#Quantitative vs. Qualitative: Create side-by-side boxplots (using both plot() and ggplot2)
#to visualize the distribution of AGEP_A across different levels of SEX_A and EDUCP_A.
NHISclean <- read.csv(file.choose(), header = T)
head(NHISclean) #Display the 
attach(NHISclean) #Attach NHISclean data for easier coding

library(ggplot2) #Load ggplot2 package to use plots 
par(mfcol=c(1,2)) #Displays one row and two columns of graphs


#Recode values of Sex variable from integers to meaningful words
NHISclean$SEX_A_new[NHISclean$SEX_A==1]<- "Male" 
NHISclean$SEX_A_new[NHISclean$SEX_A==2]<- "Female"

#Create Base R Boxplot of distribution of Age by Sex
boxplot(AGEP_A~SEX_A_new, data= NHISclean ,xlab = "Sex", ylab = "Age", 
        main= "Distribution of Age by Sex", col= "lavender", 
        names= c("Male","Female"))

#Create Base R Boxplot of distribution of Age by Education Level
boxplot(AGEP_A~EDUCP_A_recoded, xlab = "Education Level", ylab = "Age",
        main= "Distribution of Age by Education Level", col="indianred",
        names= c("less than HS","HS Grad",
                      "Some College","College Grad+"))

#Create ggplot2 boxplot of Age by Sex
ggplot(NHISclean, aes(x=SEX_A_new, y= AGEP_A))+
  geom_boxplot(aes(fill=factor(SEX_A_new)))+
  labs(title = "Distribution of Age by Sex", x="Sex", y="Age")+
  theme_minimal()

#Create ggplots2 Boxplot of distribution of Age by Education Level
ggplot(NHISclean, aes(x=EDUCP_A_recoded, y=AGEP_A))+
  geom_boxplot(aes(fill = factor(EDUCP_A_recoded)))+
  labs(title = "Distribution of Age by Education Level", 
       x= "Education Level",
       y="Age")+
  theme_minimal()

#Recode General Health Status variable from integers to meaningful words
NHISclean$PHSTAT_A_new[NHISclean$PHSTAT_A==1] <-"Excellent"
NHISclean$PHSTAT_A_new[NHISclean$PHSTAT_A==2] <-"Very good"
NHISclean$PHSTAT_A_new[NHISclean$PHSTAT_A==3] <-"Good"
NHISclean$PHSTAT_A_new[NHISclean$PHSTAT_A==4] <-"Fair"
NHISclean$PHSTAT_A_new[NHISclean$PHSTAT_A==5] <-"Poor"

#Recode General Health variable from integers to meaningful words
NHISclean$LSATIS4R_A_new[NHISclean$LSATIS4R_A==1]<- "Very Satisfied"
NHISclean$LSATIS4R_A_new[NHISclean$LSATIS4R_A==2]<- "Satisfied"
NHISclean$LSATIS4R_A_new[NHISclean$LSATIS4R_A==3]<- "Dissatisfied"
NHISclean$LSATIS4R_A_new[NHISclean$LSATIS4R_A==4]<- "Very Dissatisfied"

#Create a clustered bar chart (using ggplot2) to show the relationship between 
#PHSTAT_A (General Health) and LSATIS4R_A (Life Satisfaction).

ggplot(data=NHISclean, aes(x=PHSTAT_A_new, y=LSATIS4R_A_new, fill = LSATIS4R_A_new))+
  geom_bar(stat = "identity", position= position_dodge())+
  labs(title = "Cluster Barplot of the relationship between 
       General Health and Life Satisfaction",
       x="General Health",
       y="Life Satisfaction")

  #scale_fill_discrete(name="Life Satisfaction", 
  #                    labels= c("Very Satisfied","Satisfied","Dissatisfied","Very dissatisfied"))


#Create a scatter plot (using both plot() and ggplot2) of HEIGHTTC_A vs. WEIGHTLBTC_A. 

par(mfcol=c(1,1)) #Displays one row and one column of graphs

#Create Base R scatter plot of HEIGHTTC_A vs. WEIGHTLBTC_A
plot(HEIGHTTC_A,WEIGHTLBTC_A,
     xlab = "Height",
     ylab = "Weight",
     pch = 19,
     col=4,
     smooth=FALSE,  #remove smooth estimate
     regLine=FALSE, #remove linear estimate
     main = "Distribution of Height vs Weight") 

#Create ggplot2 scatter plot of HEIGHTTC_A vs. WEIGHTLBTC_A
ggplot(NHISclean, aes(x=HEIGHTTC_A, y=WEIGHTLBTC_A))+
  geom_point(color="royalblue")+
  geom_smooth(method="lm")+     #observe regression line
  ggtitle("Distribution of Height vs Weight")+
  xlab("Height")+
  ylab("Weight")
  
#Calculate and report the correlation coefficient.
cor(HEIGHTTC_A,WEIGHTLBTC_A) 
#Results= 0.4890768


