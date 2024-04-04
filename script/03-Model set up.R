#### Preamble ####
# Purpose : Model set up
# Author : Lin Dai
# Email : dailin20000730@gmail.com
# Date : April 4, 2024

# Work space set up
library(rstanarm)
library(readr)

# Read the simulated data

library(readr)
simulated_party_support_data <- read_csv("data/simulated_party_support_data.csv")
simulated_data <- simulated_party_support_data

# Convert Support_for_Party variable to binary (0/1)

simulated_data$Support_for_Party <- ifelse(simulated_data$Support_for_Party == "Yes", 1, 0)

# Model set up use rstanarm

sim_party_support_model <- stan_glm(
  formula = Support_for_Party ~ Age_Group + Gender + Income_Group + Highest_Education,  
  data = simulated_data,   
  family = binomial(link = "logit"),  
  prior = normal(location = 0, scale = 2.5),  
  prior_intercept = normal(location = 0, scale = 2.5),  
  prior_aux = exponential(rate = 1),  
  seed = 123,  
  prior_PD = TRUE  
)

# Save the model object

saveRDS(
  sim_party_support_model,
  file = "simulated_party_support_model.rds"
)
