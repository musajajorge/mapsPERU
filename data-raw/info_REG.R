
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

################################################################################

boundaries_REG <- readRDS("boundaries_REG.RDS")
centroids_REG <- readRDS("centroids_REG.RDS")

################################################################################

usethis::use_data(boundaries_REG, centroids_REG, overwrite=TRUE)
