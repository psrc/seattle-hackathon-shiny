library(shiny)
library(tidyverse)
library(leaflet)
library(sf)
library(bslib)
library(echarts4r)
library(psrcplot)
library(DT)
library(RSocrata)

load(file = "seattle_bldgpmt_rse.rda")

# run all files in the modules sub-directory
module_files <- list.files('modules', full.names = TRUE)
sapply(module_files, source)
