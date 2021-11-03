
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

################################################################################

map_DEP <- readRDS("map_DEP.RDS")

################################################################################

usethis::use_data(map_DEP, overwrite=TRUE)
