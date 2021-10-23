#' @title Regional boundaries of Peru
#' @description Load the dataset of the geographic limits of the regions of Peru.
#' @param x indicates whether you want to obtain the regional boundaries or the centroids. Choose 1 or leave this parameter empty if you want to obtain the regional boundaries. Choose 2 if you want to obtain the centroids of each region.
#' @details Officially there is no codification for regions, only for departments. Therefore, the codes 150100 for Metropolitan Lima and 159900 for Lima Provinces should be taken as a reference.
#' @import ggplot2
#' @import dplyr
#' @examples
#' # regional boundaries of Peru
#' get_REG()
#' get_REG(1)
#'
#' # centroids of each region of Peru
#' get_REG(2)
#'
#' # use regional boundaries of Peru in a map with ggplot2
#' boundaries <- get_REG(1)
#' library(ggplot2)
#' ggplot(data=boundaries)+
#' aes(x=long, y=lat, group=group)+
#' geom_polygon(aes(fill=REGION))+
#' coord_equal()+
#' geom_path(color="black")
#'
#' # use regional boundaries of Peru and centroids in a map with ggplot2
#' boundaries <- get_REG(1)
#' centroids <- get_REG(2)
#' library(ggplot2)
#' ggplot(data=boundaries)+
#' aes(x=long, y=lat, group=group)+
#' geom_polygon(aes(fill=REGION))+
#' coord_equal()+
#' geom_path(color="black")+
#' geom_text(data=centroids, aes(long, lat, group=NULL, label=REGION), size=2)
#'
#' @export

get_REG <- function(x=1) {
  if (x==1) {return(readRDS(system.file("extdata", "map_reg.RDS", package="mapsPERU")))}
  if (x==2) {return(readRDS(system.file("extdata", "c_map_reg.RDS", package="mapsPERU")))}
}
