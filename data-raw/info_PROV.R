
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

################################################################################

map_PROV <- readRDS("map_PROV.RDS")

################################################################################

usethis::use_data(map_PROV, overwrite=TRUE)
