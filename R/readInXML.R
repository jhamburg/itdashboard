#-----------------------------------
# Change archived XML data into R
#-----------------------------------

library(XML)

readInXMLs <- function(yr){
  dir <- file.path('data', 'raw', yr)
  files <- list.files(dir)
  
  xmlReadFunc <- function(x) xmlToDataFrame(file.path(dir, x))
  
  aa <- lapply(files, xmlReadFunc)
  return(aa)
}

aa <- readInXMLs(2013)
