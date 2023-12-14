url <- "https://data.seattle.gov/resource/76t5-zqzr.json" # building permits
df <- read.socrata(url, app_token = Sys.getenv("RSOCRATA_SEATTLE_APP_TOKEN"))

permit_22_23<-permit_sf
st_geometry(permit_22_23) <- NULL

permit_22_23_2<-permit_22_23 %>% 
  mutate(year=lubridate::year(date(issueddate)),
         housingunitsadded=as.numeric(housingunitsadded))%>%
  filter(!is.na(GEOID),
         !is.na(issueddate),
         !is.na(applieddate),
         year%in% c(2022, 2023) & permitclassmapped =='Residential' & housingunitsadded>0.1)%>%
  mutate(time_to_permit=difftime(issueddate, applieddate, units='days'))%>%
  mutate(housingunitgrp = case_when(housingunitsadded==1 ~'Single-Family',
                                    housingunitsadded>1 & housingunitsadded<=9~ '2-9 units',
                                    housingunitsadded>9 & housingunitsadded<=20 ~ '10-20 units',
                                    housingunitsadded>20 ~ 'More than 20 units')) %>%
  group_by(GEOID, TRACT, housingunitgrp, COMPOSITE_QUINTILE)%>%
  summarise(n_permit_issued = n(),
            median_time_to_permit=median(time_to_permit), 
            mean_time_to_permit=mean(time_to_permit), 
            sd_time_to_permit=sd(time_to_permit))%>%
  mutate(housingunitgrp_fact=factor(housingunitgrp, levels=c('Single-Family','2-9 units', '10-20 units', 'More than 20 units')))%>%
  mutate(COMPOSITE_QUINTILE_fact=factor(COMPOSITE_QUINTILE, levels= c('Lowest', 'Second Lowest', 'Middle', 'Second Highest', 'Highest Equity Priority')))

permit_22_23_map <- rse_index %>% full_join(permit_22_23_2, by=c("GEOID","TRACT"))
  