#' @title Departmental boundaries of Peru
#' @description Load the dataset of the geographic limits of the departments of Peru.
#' @param x indicates whether you want to obtain the departmental boundaries or the centroids. Choose 1 or leave this parameter empty if you want to obtain the departmental boundaries. Choose 2 if you want to obtain the centroids of each department.
#' @import ggplot2
#' @import dplyr
#' @examples
#' # departmental boundaries of Peru
#' get_DEP()
#' get_DEP(1)
#'
#' # centroids of each department of Peru
#' get_DEP(2)
#'
#' # use departmental boundaries of Peru in a map with ggplot2
#' boundaries <- get_DEP(1)
#' library(ggplot2)
#' ggplot(data=boundaries)+
#' aes(x=long, y=lat, group=group)+
#' geom_polygon(aes(fill=DEPARTAMENTO))+
#' coord_equal()+
#' geom_path(color="black")
#'
#' # use departmental boundaries of Peru and centroids in a map with ggplot2
#' boundaries <- get_DEP(1)
#' centroids <- get_DEP(2)
#' library(ggplot2)
#' ggplot(data=boundaries)+
#' aes(x=long, y=lat, group=group)+
#' geom_polygon(aes(fill=DEPARTAMENTO))+
#' coord_equal()+
#' geom_path(color="black")+
#' geom_text(data=centroids, aes(long, lat, group=NULL, label=DEPARTAMENTO), size=2)
#'
#' @export

get_DEP <- function(x=1) {
  if (x==1) {return(readRDS(system.file("extdata", "map_dep.RDS", package="mapsPERU")))}
  if (x==2) {return(readRDS(system.file("extdata", "c_map_dep.RDS", package="mapsPERU")))}
}
