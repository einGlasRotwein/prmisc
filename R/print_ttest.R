

#' Print the results of a t-test
#'
#' @param t_object an object returned by `afex`s ANOVA functions
#' @param d_object An object returned by `effsize::cohen.d`
#' @param decimals how many decimals should be printed
#' @param decimals_p how many decimals should be printed for the p-value
#'     (defaults to 3)
#' @param paired Logical vector of length 1. Was the t-test a
#'     within-subjects comparison? Determines whether Cohen's d is
#'     printed as d_z when TRUE. Defaults to FALSE.
#'
#' @details 
#' 
#' To use this function, you need to install the R package effsize and 
#' compute a Cohen's d object; pass this object as the second argument.
#'   
#'
#' @author Martin Papenberg \email{martin.papenberg@@hhu.de}
#' @export
#'
print_ttest <- function(t_object, d_object, decimals=2, decimals_p = 3,
                        paired = FALSE) {
  p <- format_p(t_object$p.value, decimals_p)
  t <- paste0("$t(", round(t_object$parameter, decimals), ") = ")
  t <- paste0(t, force_decimals(t_object$statistic, decimals), "$")
  d <- "$d = "
  if (paired) d <- "$d_z = "
  d <- paste0(d, force_decimals(d_object$estimate, decimals), "$")
  return(paste(t, p, d, sep = ", "))
}