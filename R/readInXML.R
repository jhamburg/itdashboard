#-----------------------------------
# Change archived XML data into R
#-----------------------------------

library(data.table)
library(XML)

source(file.path('R', 'utilities.R'))

readInXMLs <- function(yr){
  dir <- file.path('data', 'raw', yr)
  files <- list.files(dir)
  fnms <- substr(files, 1, regexpr("\\.xml", files) - 1)
  updFnms <- updVarNames(fnms)
  
  xmlReadFunc <- function(x) as.data.table(xmlToDataFrame(file.path(dir, x)))
  
  raw <- lapply(files, xmlReadFunc)
  names(raw) <- updFnms
  return(raw)
}

aa <- readInXMLs(2013)