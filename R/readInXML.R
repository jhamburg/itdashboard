#-----------------------------------
# Change archived XML data into R
#-----------------------------------

library(XML)

readInXMLs <- function(yr){
  dir <- file.path('data', 'raw', yr)
  files <- list.files(dir)
  fnms <- substr(files, 1, regexpr("\\.xml", files) - 1)
  updFnms <- updVarNames(fnms)
  
  xmlReadFunc <- function(x) xmlToDataFrame(file.path(dir, x))
  
  raw <- lapply(files, xmlReadFunc)
  names(raw) <- updFnms
  return(raw)
}

aa <- readInXMLs(2013)