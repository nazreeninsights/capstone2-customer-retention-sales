# Sales by Category and Gender
library(ggplot2)

data = read.csv("Complete.csv", stringsAsFactors = TRUE)
ggplot(data, aes(x = Category, y=Sales, fill=Gender)) +
  geom_bar(stat = "Identity", position = "dodge") + 
  labs(title = "Sales by Category and Gender", x = "Product Category", y = "Sales") + 
  theme_minimal()

# Sales by Region

ggplot(data, aes(x = Region, y = Sales)) +
  geom_boxplot(fill = "blue") + 
  labs(title = "Sales Distribution by Region", x = "Region", y = "Sales") +
  theme_minimal()