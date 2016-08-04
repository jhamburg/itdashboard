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
  
  xmlReadFunc <- function(x){
    cat(paste(x, '\n\n'))
    # Need to take out IT Portfolio Funding Sources due to 
    # issues with the XML file
    if (grepl('.xml', x, ignore.case = TRUE)){
      res <- as.data.table(xmlToDataFrame(file.path(dir, x)))
    } else {
      res <- fread(file.path(dir, x))
    }
    return(res)
  }
  
  raw <- lapply(files, xmlReadFunc)
  names(raw) <- updFnms
  return(raw)
}

