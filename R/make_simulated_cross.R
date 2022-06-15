#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param simulated_map
#' @param simulated_qtl_model
#' @return
#' @author 'Jay
#' @export
make_simulated_cross <- function(simulated_map, simulated_qtl_model) {

  simulated_cross <- sim.cross(simulated_map, 
                               model        = simulated_qtl_model, 
                               n.ind        = 150, 
                               type         = "bc", 
                               missing.prob = 0.05, 
                               map.function = "kosambi")
  
  new_pheno_effects <- rnorm(10, sd = 5)
  for(i in 1:length(new_pheno_effects)){
    new_pheno_name <- paste("phenotype", i + 1, sep = "_")
    
    simulated_cross$pheno[[new_pheno_name]] <- simulated_cross$pheno$phenotype + new_pheno_effects[[i]]
  }
  
  return(simulated_cross)
}
