## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

## tar_plan supports drake-style targets and also tar_target()
tar_plan(

  # LG sizes from previous maps
  tar_target(expected_lg_sizes_file, 
             "https://raw.githubusercontent.com/jhgille2/SoybaseData/master/ExpectedLGSizes.csv", 
             format = "url"), 
  
  # Read in this file
  tar_target(expected_lg_sizes, 
             read_csv(expected_lg_sizes_file)), 
  
  # Simulate a map
  tar_target(simulated_map, 
             make_simulated_map(expected_lg_sizes, num_markers = 1400)),
  
  # An additive qtl model
  tar_target(simulated_qtl_model, 
             make_qtl_model()),
  
  # Simulate a cross from this map
  tar_target(simulated_cross, 
             make_simulated_cross(simulated_map, simulated_qtl_model))
  

)
