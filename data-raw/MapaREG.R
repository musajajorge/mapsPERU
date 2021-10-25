
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

################################################################################

library(maptools)
library(sp)
library(ggplot2)
library(tidyverse)
library(readxl)

################################################################################

reg <- read_excel("INEI_UBIGEO_2016.xlsx", sheet="REGION")
glimpse(reg)

#------------------------------------------------------------------------------#

mapa <- readShapeSpatial("peru.shp")
mapa@data$id = as.numeric(rownames(mapa@data))
mapa@data$id <- as.numeric(mapa@data$id)+1
#View(mapa@data)
glimpse(mapa@data)

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
puntos <- left_join(puntos, centroides, by="id")
glimpse(puntos)

puntos <- left_join(puntos, reg, by="FIRST_NOMB")

#------------------------------------------------------------------------------#

boundaries_REG <- select(puntos, long, lat, COD_REGION, REGION, group)
boundaries_REG <- arrange(boundaries_REG, COD_REGION)

boundaries_REG <- (unique(boundaries_REG))

boundaries_REG$long <- round(boundaries_REG$long, 3)
boundaries_REG$lat <- round(boundaries_REG$lat, 3)

glimpse(boundaries_REG)

#------------------------------------------------------------------------------#

centroids_REG <- puntos %>%
  group_by(X1,X2) %>%
  summarise(unique(COD_REGION),unique(REGION))
colnames(centroids_REG) <- c("long","lat","COD_REGION","REGION")
centroids_REG <- arrange(centroids_REG, COD_REGION)

glimpse(centroids_REG)

################################################################################

usethis::use_data(boundaries_REG, centroids_REG, overwrite=TRUE)
