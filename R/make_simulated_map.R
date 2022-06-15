#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param expected_lg_sizes
#' @param num_markers
#' @return
#' @author 'Jay
#' @export
make_simulated_map <- function(expected_lg_sizes, num_markers = 1400) {
  
  # LG names 
  lg_names <- expected_lg_sizes$Chr
  
  # LG_lengths 
  lg_lens <- expected_lg_sizes$Len_Con
  
  # Number of markers per chromosome
  mar_per_lg <- ceiling(num_markers/length(lg_lens))
  

  # Siulate the map using these variables
  simulated_map <- qtl::sim.map(len        = lg_lens, 
                                n.mar      = rep(mar_per_lg, length(mar_per_lg)), 
                                eq.spacing = FALSE, 
                                include.x  = FALSE)
  
  return(simulated_map)

}
