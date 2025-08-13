getwd()
setwd("C:/Mac/Home/Documents/Data Analytic Study UMK/Capstone 2")
data = read.csv("Complete.csv", stringsAsFactors = TRUE)
data$TransactionDate = as.Date(data$TransactionDate, format="%d/%m/%y")

data = na.omit(data)

# Chi-Squared
gender_category = table(data$Gender, data$Category)

chi_result = chisq.test(gender_category)
print(chi_result)

# ANOVA

anova_result = aov(Sales ~ Region, data = data)
summary(anova_result)