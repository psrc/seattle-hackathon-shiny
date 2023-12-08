library(shiny)
library(tidyverse)
# library(DBI)
# library(odbc)
# library(leaflet)
# library(sf)
# library(shinyjs)
library(bslib)


# run all files in the modules sub-directory
module_files <- list.files('modules', full.names = TRUE)
sapply(module_files, source)
