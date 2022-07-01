#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title

#' @return
#' @author 'Jay
#' @export
make_qtl_model <- function() {

  # First column is the chromosome number, second is the cM position, and third is the 
  # effect size
  qtl_mod <- rbind(c(1, 50, 0.2), 
                   c(20, 30, 1), 
                   c(15, 45, 0.5), 
                   c(4, 20, 0.05), 
                   c(15, 80, 1.5), 
                   c(2, 50, 0.6))
  
  return(qtl_mod)
}
