#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param imputed_cross
#' @param nPerms
#' @param nCore
perform_permutations <- function(imputed_cross, nPerms = 10, nCore = 3) {

  scantwo(imputed_cross, 
          pheno.col = phenames(imputed_cross), 
          method    = "imp", 
          n.cluster = nCore, 
          n.perm    = nPerms)

}
