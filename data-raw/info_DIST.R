
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

################################################################################

boundaries_DIST <- readRDS("boundaries_DIST.RDS")
centroids_DIST <- readRDS("centroids_DIST.RDS")

################################################################################

usethis::use_data(boundaries_DIST, centroids_DIST, overwrite=TRUE)
