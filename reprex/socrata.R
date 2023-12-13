library(RSocrata)

# fremont bicycle counter
url <- "https://data.seattle.gov/resource/65db-xm6k.json" 

df <- read.socrata(url, app_token = Sys.getenv("RSOCRATA_SEATTLE_APP_TOKEN"))

# To edit .Renviron: usethis::edit_r_environ()
# https://support.posit.co/hc/en-us/articles/360047157094-Managing-R-with-Rprofile-Renviron-Rprofile-site-Renviron-site-rsession-conf-and-repos-conf