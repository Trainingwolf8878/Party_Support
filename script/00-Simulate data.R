#### Preamble ####
# Purpose : Simulate data 
# Author : Lin Dai
# Email : dailin20000730@gmail.com
# Date : 04 April 2024

# Work space set up
library(tidyverse)

# set random seed
set.seed(123)

# simulate data
simulated_data <- tibble(
  Age_Group = sample(c("18-24", "25-34", "35-44", "45-54", "55-64", "65+"), 1000, replace = TRUE),
  Gender = sample(c("Male", "Female"), 1000, replace = TRUE),
  Income_Group = sample(c("Low", "Medium", "High"), 1000, replace = TRUE),
  Highest_Education = sample(c("High School", "Bachelor's Degree", "Master's Degree", "PhD"), 1000, replace = TRUE),
  Support_for_Party = sample(c("Yes", "No"), 1000, replace = TRUE)
)

# download csv file
write_csv(simulated_data, "simulated_party_support_data.csv")
