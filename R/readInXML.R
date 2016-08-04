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

#years <- c(2012, 2013, 2014, 2015)
years <- c(2013, 2014, 2015)

# Save data from XML file to RDS
saveDataToRDS <- function(yr){
  res <- readInXMLs(yr)
  saveDir <- file.path('data','rds', yr)
  lapply(res, function(x) saveRDS(x, file.path(saveDir, names(x))))
}

lapply(years, saveDataToRDS)