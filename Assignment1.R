##download and unzip file
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("diet_data.zip", exdir = "specdata")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  files_full <- list.files(directory, full.names=TRUE)
  tmp <- vector(mode = "list", length = length(files_full))
  for (i in seq_along(files_full)) {
    tmp[[i]] <- read.csv(files_full[[i]])
  }
  
  return(mean(do.call(rbind,tmp[id])[, pollutant], na.rm=TRUE)) 
}
