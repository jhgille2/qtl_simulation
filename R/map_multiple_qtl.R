#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param imputed_cross
#' @param qtl_penalties
map_multiple_qtl <- function(imputed_cross, qtl_penalties) {

  stepwiseqtl(imputed_cross, 
              pheno.col = phenames(imputed_cross), 
              method    = "imp", 
              penalties = qtl_penalties)

}
