#Pull fire history data off the IMPD (by state) and write the fhx files
#user specifies the state for which she wants data on line 7 

library(rIMPD)

#make a variable for the location of interest
state <- "Oregon"

#make a data frame with all fire history sites for the state
state_impd <- search_impd(location = (state))

#Get the FHX files for all sites in state
#this gets the first 8 rows (row 9 has an error in the FHX file)
for(i in 1:nrow(state_impd)) {       
  site <- get_impd_fhx(state_impd[i, ]$studyCode)
  sitename <- state_impd$studyCode[i]
  write_fhx(site, (paste0(sitename, ".fhx")))
}

#get rows 10-15
for(i in 10:nrow(state_impd)) {       
  site <- get_impd_fhx(state_impd[i, ]$studyCode)
  sitename <- state_impd$studyCode[i]
  write_fhx(site, (paste0(sitename, ".fhx")))
}

#what's up w/ site9/potholes?
USPOT002 <- get_impd_fhx(state_impd[9, ]$studyCode)
