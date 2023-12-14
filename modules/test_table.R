url <- "https://data.seattle.gov/resource/76t5-zqzr.json" # building permits
df <- read.socrata(url, app_token = Sys.getenv("RSOCRATA_SEATTLE_APP_TOKEN"))

# df2 <- df %>%
#   mutate(issued_date2 = ymd(issueddate)) %>%
#   mutate(issued_year = year(issued_date2)) %>%
#   filter(issued_year >= 2022) %>%
#   mutate(difftime = as.numeric(difftime(ymd(),
#                                           ymd(ExpectedDate), units = "days")))

permit_22_23<-permit_sf%>%mutate(year=lubridate::year(date(issueddate)))%>%
  mutate(housingunitsadded=as.numeric(housingunitsadded))%>%
  filter(year%in% c(2022, 2023) & permitclassmapped =='Residential' & housingunitsadded>0.1)%>%
  mutate(time_to_permit=difftime(issueddate, applieddate, units='days'))%>%
  filter(!is.na(time_to_permit))%>%
  mutate(housingunitgrp = case_when(housingunitsadded==1 ~'Single-Family',
                                    housingunitsadded>1 & housingunitsadded<=9~ '2-9 units',
                                    housingunitsadded>9 & housingunitsadded<=20 ~ '10-20 units',
                                    housingunitsadded>20 ~ 'More than 20 units'))%>%
  group_by(COMPOSITE_QUINTILE, housingunitgrp)%>%
  summarise(median_time_to_permit=median(time_to_permit), mean_time_to_permit=mean(time_to_permit), sd_time_to_permit=sd(time_to_permit))%>%drop_na()
