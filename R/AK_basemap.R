#' AK_basemap
#' @description Imports an sf polygon of Alaska. The projection is WGS 1984
#' @return
#' @export
#'
#' @examples AK<-AK_basemap()
AK_basemap<-function(){
  readRDS(system.file("extdata", "AKbasemap.RDS", package="AKmarineareas"))
}
