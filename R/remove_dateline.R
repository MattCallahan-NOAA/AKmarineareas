#' remove_dateline
#' @description This function removes the annoying dateline artifact from sf objects that cross the dateline
#' Code: x%>%st_buffer(1) %>%st_transform(st_crs(3338)) %>%st_simplify
#' @param x The object from which the dateline should be removed
#'
#' @return
#' @export
#'
#' @examples x<-remove_dateline(x)
remove_dateline<-function(x){
 # my_proj <- '+proj=moll +lon_0=177 +lat_0=65 +units=m'
  x%>%
    st_buffer(1) %>%
    st_transform(st_crs(3338)) %>%
    st_simplify
}
