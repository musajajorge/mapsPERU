
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

################################################################################

map_DIST <- readRDS("map_DIST.RDS")

################################################################################

usethis::use_data(map_DIST, overwrite=TRUE)
