# Accessing Seattle GeoData:
# Click on 'Common Core Homepage' link (opendata.arcgis.com)
# Click on 'View API Resources'
# Copy GeoJSON url

tract20 <- st_read("https://services.arcgis.com/ZOyb2t4B0UYuYNYH/arcgis/rest/services/2020_Census_Tracts_Seattle/FeatureServer/3/query?outFields=*&where=1%3D1&f=geojson")

# tract10 <- st_read("https://services.arcgis.com/ZOyb2t4B0UYuYNYH/arcgis/rest/services/Census_2010_Statistics/FeatureServer/15/query?outFields=*&where=1%3D1&f=geojson")
