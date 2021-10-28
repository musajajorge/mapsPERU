
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

################################################################################

library(maptools)
library(sp)
library(ggplot2)
library(tidyverse)
library(readxl)
library(sf)

################################################################################

dep <- read_excel("INEI_UBIGEO_2016.xlsx", sheet="DEPARTAMENTO")
dep$id = as.numeric(dep$id)
glimpse(dep)

#------------------------------------------------------------------------------#

mapa <- readShapeSpatial("DEPARTAMENTOS.shp")
mapa@data$id = as.numeric(rownames(mapa@data))
mapa@data$id <- as.numeric(mapa@data$id)+1

#View(mapa@data)
glimpse(mapa@data)

#------------------------------------------------------------------------------#

geometria <- st_read("DEPARTAMENTOS.shp")
geometria <- st_simplify(geometria, dTolerance=100)

object.size(geometria)

geometria$id <- as.numeric(geometria$IDDPTO)
geometria <- select(geometria, id, geometry)

#------------------------------------------------------------------------------#

puntos <- fortify(mapa)
glimpse(puntos)

puntos$id <- as.numeric(puntos$id)+1
table(puntos$id)

#------------------------------------------------------------------------------#

centroides <- data.frame(coordinates(mapa))
centroides$id <- row.names(centroides)
centroides$id <- as.numeric(centroides$id)+1

#------------------------------------------------------------------------------#

puntos <- left_join(puntos, mapa@data, by="id")
puntos <- left_join(puntos, dep, by="id")
puntos <- left_join(puntos, centroides, by="id")
glimpse(puntos)

#------------------------------------------------------------------------------#

boundaries_DEP <- select(puntos, "long","lat","COD_DEPARTAMENTO","DEPARTAMENTO","group")

boundaries_DEP <- (unique(boundaries_DEP))

boundaries_DEP$long <- round(boundaries_DEP$long, 2)
boundaries_DEP$lat <- round(boundaries_DEP$lat, 2)

boundaries_DEP$group <- as.numeric(boundaries_DEP$group)

glimpse(boundaries_DEP)

#------------------------------------------------------------------------------#

centroids_DEP <- puntos %>%
  group_by(X1,X2,id) %>%
  summarise(unique(COD_DEPARTAMENTO),unique(DEPARTAMENTO))

centroids_DEP <- left_join(centroids_DEP, geometria, by="id")
centroids_DEP <- centroids_DEP[,c(1,2,4,5,6)]
colnames(centroids_DEP) <- c("long","lat","COD_DEPARTAMENTO","DEPARTAMENTO","geometry")
centroids_DEP <- arrange(centroids_DEP, COD_DEPARTAMENTO)

glimpse(centroids_DEP)

################################################################################

usethis::use_data(boundaries_DEP, centroids_DEP, overwrite=TRUE)
