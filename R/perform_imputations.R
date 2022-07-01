#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param simulated_cross
#' @param n.draws
perform_imputations <- function(simulated_cross, n.draws) {

  sim.geno(simulated_cross, n.draws, map.function = "kosambi")

}
