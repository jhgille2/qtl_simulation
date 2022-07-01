## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

# The number of draws to use for multiple imputation
draw_nums <- tibble(n.draws = c(25, 50, 100, 250, 500, 750, 1000))

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
             make_simulated_cross(simulated_map, simulated_qtl_model)), 
  
  # Perform multiple imputation on the cross object to prepare new crosses
  # for multiple-qtl models
  mapping_targets <- tar_map(
    values = draw_nums, 
    
    # Perform imputations and then a permutation test on the imputed crosses
    tar_target(imputed_cross, 
               perform_imputations(simulated_cross, n.draws)), 
    
    # Perform permutations
    tar_target(imputed_permutations,
               perform_permutations(imputed_cross, nPerms = 10, nCore = 3)),
    
    # Calculate penalties from the permutations
    tar_target(qtl_penalties, 
               calc.penalties(imputed_permutations)), 
    
    # Perform multiple qtl mapping with the stepwise qtl function
    tar_target(multiple_qtl_results, 
               map_multiple_qtl(imputed_cross, qtl_penalties))
    
  ),
  
  # Combine the mapping results into a list
  tar_combine(mapping_results, 
              mapping_targets[[4]], 
              command = list(!!!.x))
)
