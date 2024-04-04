#### Preamble ####
# Purpose : Graph the support party yes/no compare to age group
# Author : Lin Dai
# Email : dailin20000730@gmail.com
# Date : 04 April 2024

# Work space set up

library(readr)
simulated_party_support_data <- read_csv("data/simulated_party_support_data.csv")
simulated_data <- simulated_party_support_data
library(ggplot2)


# Graph the compare graph

ggplot(simulated_data, aes(x = Age_Group, fill = Support_for_Party)) +
  geom_bar(data = filter(simulated_data, Support_for_Party == "Yes"), aes(y = ..count..), stat = "count", position = "dodge") +
  geom_bar(data = filter(simulated_data, Support_for_Party == "No"), aes(y = -..count..), stat = "count", position = "dodge") +
  labs(title = "Support and Opposition to Party by Age Group",
       x = "Age Group",
       y = "Number of People",
       fill = "Support for Party") +
  theme_minimal() +
  theme(legend.position = "bottom") +
  scale_y_continuous(labels = abs) +
  guides(fill = guide_legend(title = "Support for Party"))

