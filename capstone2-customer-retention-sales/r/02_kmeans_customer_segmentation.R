# K-Mean
library(dplyr)
library(ggplot2)

data <- read.csv("Complete.csv", stringsAsFactors = FALSE)

data$TransactionDate <- as.Date(data$TransactionDate, format = "%d/%m/%y")

reference_date <- max(data$TransactionDate, na.rm = TRUE)

customer_data <- data %>%
  group_by(CustomerID, Gender, Age, Region) %>%
  summarise(
    Frequency = n(),
    Monetary = sum(Sales, na.rm = TRUE),
    LastPurchase = max(TransactionDate, na.rm = TRUE)
  ) %>%
  ungroup() %>%
  mutate(Recency = as.numeric(reference_date - LastPurchase)) %>%
  select(-LastPurchase)

clustering_data <- customer_data %>%
  select(Recency, Frequency, Monetary, Age) %>%
  scale()

set.seed(123)
k_result <- kmeans(clustering_data, centers = 3)

customer_data$Cluster <- as.factor(k_result$cluster)

ggplot(customer_data, aes(x = Recency, y = Monetary, color = Cluster)) +
  geom_point() +
  labs(title = "Customer Segments", x = "Recency", y = "Monetary") +
  theme_minimal()