
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

################################################################################

map_REG <- readRDS("map_REG.RDS")

################################################################################

usethis::use_data(map_REG, overwrite=TRUE)
