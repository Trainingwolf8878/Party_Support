#### Preamble ####
# Purpose : Test simulate data of party support
# Author : Lin Dai
# Email : dailin20000730@gmail.com
# Date : 04 April 2024

# Work space set up

library(readr)
simulated_party_support_data <- read_csv("data/simulated_party_support_data.csv")

# Check for missing values in the dataset
any_missing <- any(is.na(simulated_data))
if (any_missing) {
  print("There are missing values in the dataset.")
} else {
  print("There are no missing values in the dataset.")
}

# Check data types of variables
variable_types <- sapply(simulated_data, class)
print(variable_types)


# Check if all values in the dataset are numeric
all_numeric <- all(sapply(simulated_data, is.numeric))
if (all_numeric) {
  print("All values in the dataset are numeric.")
} else {
  print("Not all values in the dataset are numeric.")
}

# Check for unique values in each variable
unique_values <- sapply(simulated_data, function(x) length(unique(x)))
print(unique_values)

# Check if all values in each variable are the same
constant_values <- sapply(simulated_data, function(x) length(unique(x)) == 1)
if (any(constant_values)) {
  print("There are variables with constant values.")
} else {
  print("There are no variables with constant values.")
}

# Calculate summary statistics for each variable
summary_stats <- summary(simulated_data[, -1])
print(summary_stats)

# Test the support only have yes and no variable

test1 <- all(simulated_data$Support_for_Party %in% c("Yes", "No"))
if (test1) {
  print("Test 1: Support_for_Party contains only 'Yes' and 'No'. PASSED")
} else {
  print("Test 1: Support_for_Party does not contain only 'Yes' and 'No'. FAILED")
}

# Test the gender only have male and female variable

test2 <- all(simulated_data$Gender %in% c("Male", "Female"))
if (test2) {
  print("Test 2: Gender contains only 'Male' and 'Female'. PASSED")
} else {
  print("Test 2: Gender does not contain only 'Male' and 'Female'. FAILED")
}

# test the income only have low medium and high variable

test3 <- all(simulated_data$Income_Group %in% c("Low", "Medium", "High"))
if (test3) {
  print("Test 3: Income_Group contains only 'Low', 'Medium', and 'High'. PASSED")
} else {
  print("Test 3: Income_Group does not contain only 'Low', 'Medium', and 'High'. FAILED")
}
