#' AK_marine_area
#'
#' @description This package imports sf objects from RDS files
#' containing spatial boundaries of marine management areas.
#' Areas include NMFS areas, ADFG stat areas, Ecosystem boundaries,
#' and BSIERP regions. WGS 1984 and an Alaska Albers projection versions
#' are available. Data were originally compiled in a filegeodatabase
#' produced by Brett Holycross at PSMFC.
#' @param area the area of interest.
#' "NMFS Reporting Area" (Default)
#' "Ecosystem Area"
#' "Ecosystem Subarea"
#' "Ecosystem Area Inside" (GOA only)
#' "Ecosystem Subarea Inside (GOA only)
#' "ADFG Stat Area"
#' "BSIERP Region"
#' "BSIERP Name"
#'
#' @param prj Projection: Default is dd, which sets WGS 1984, prj sets NAD 1983 Alaska Albers
#'
#'
#' @return
#' @export
#'
#' @examples AK_marine_area(area="NMFS Reporting Area", prj="dd")
AK_marine_area<-function(area="NMFS Reporting Area", prj="dd" ){
  readRDS(system.file("extdata",
                      paste0("AK_Marine_areas_",prj,".RDS"),
                      package="AKmarineareas")) %>%
    filter(Area_Type==area)
}

