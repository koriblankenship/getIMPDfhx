# ---
# title: 
# author: Kori Blankenship
# date: 2022 April
# ---
#Pull fire history data off the IMPD (by state) and write the fhx files
#user specifies the state for which she wants data on line 13 

## LOAD LIBRARIES
library(rIMPD)

## MAKE A VARIABLE FOR THE STATE OF INTEREST 
state <- "Oregon"

## PULL DATA FROM IMPD 
## Search for fire history by state
state_impd <- search_impd(location = (state))

## Get the FHX files for all sites in state
#this gets the first 8 rows in OR (row 9 has an error in the FHX file)
for(i in 1:nrow(state_impd)) {       
  site <- get_impd_fhx(state_impd[i, ]$studyCode)
  sitename <- state_impd$studyCode[i]
  write_fhx(site, (paste0(sitename, ".fhx")))
}

#get rows 10-15 (for OR)
#code below shouldn't be needed unless there is an error reading a file
for(i in 10:nrow(state_impd)) {       
  site <- get_impd_fhx(state_impd[i, ]$studyCode)
  sitename <- state_impd$studyCode[i]
  write_fhx(site, (paste0(sitename, ".fhx")))
}

#what's up w/ site9/potholes?
USPOT002 <- get_impd_fhx(state_impd[9, ]$studyCode)
