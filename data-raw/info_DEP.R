
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

################################################################################

boundaries_DEP <- readRDS("boundaries_DEP.RDS")
centroids_DEP <- readRDS("centroids_DEP.RDS")

################################################################################

usethis::use_data(boundaries_DEP, centroids_DEP, overwrite=TRUE)
