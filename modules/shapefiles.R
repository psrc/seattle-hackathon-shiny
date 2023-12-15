# Accessing Seattle GeoData:
# Click on 'Common Core Homepage' link (opendata.arcgis.com)
# Click on 'View API Resources'
# Copy GeoJSON url

# 
# library(RSocrata)
# library(tidyverse)
# library(leaflet)
# library(sf)
# 
# # tract20 <- st_read("https://services.arcgis.com/ZOyb2t4B0UYuYNYH/arcgis/rest/services/2020_Census_Tracts_Seattle/FeatureServer/3/query?outFields=*&where=1%3D1&f=geojson")
# # tract10 <- st_read("https://services.arcgis.com/ZOyb2t4B0UYuYNYH/arcgis/rest/services/Census_2010_Statistics/FeatureServer/15/query?outFields=*&where=1%3D1&f=geojson")
# 
# 
# # rse index sf file
# rse_index <- st_read("https://services.arcgis.com/ZOyb2t4B0UYuYNYH/arcgis/rest/services/Race_and_Social_Equity_Composite_Index_Current/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson")
# 
# 
# permit_url <- "https://data.seattle.gov/resource/76t5-zqzr.json"
# # permit data
# permit_df <- read.socrata(permit_url, app_token = Sys.getenv("RSOCRATA_SEATTLE_APP_TOKEN")) %>%
#   filter(!is.na(location1.latitude))
# 
# # transform permit data to sf file by location1.longitude and location1.latitude
# permit_sf <- st_as_sf(permit_df, coords = c("location1.longitude","location1.latitude"))
# # set crs to 4326
# permit_sf <- st_set_crs(permit_sf, 4326)
# 
# # attach rse index attributes to permit sf file
# permit_sf <- permit_sf %>% st_join(rse_index, left = TRUE)
# 
# save(permit_sf, rse_index, file = "seattle_bldgpmt_rse.rda")
# 
# 
