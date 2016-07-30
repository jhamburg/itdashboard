library(jsonlite)
library(data.table)

portWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/portfolio'
provWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/provisionedITSpending'
infraWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/infrastructureSpendingSummary'
fundingWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/fundingSource'
bcaseWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/businessCase'
tsolWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/technicalSolutions'
tsolurlWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/technicalSolutionsURLs'
invelimWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/investmentsEliminated'
invrelurlWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/investmentRelatedURLs'
lifecostsWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/lifeCycleCosts'
contractsWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/contracts'
cioRatWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/cioRating'
projectsWWW <- 
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/projects'
actWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/activities'
performWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/performance'
performactWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/performanceActual'
invbaseWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/investmentBaselineHistory'
invTrendsWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/investmentTrends'
agencyWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/agency'
bureauWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/bureau'
brmcodeWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/brmCode'
asoapgWWW <-
  'https://itdashboard.gov/api/v1/ITDB2/dataFeeds/asoapg'


portfolio <- as.data.table(fromJSON(portWWW)$result)
provIT <- as.data.table(fromJSON(provWWW)$result)
infra <- as.data.table(fromJSON(infraWWW)$result)
funding <- as.data.table(fromJSON(fundingWWW)$result)
bcase <- as.data.table(fromJSON(bcaseWWW)$result)
tsol <- as.data.table(fromJSON(tsolWWW)$result)
tsolurl <- as.data.table(fromJSON(tsolurlWWW)$result)
invelim <- as.data.table(fromJSON(invelimWWW)$result)
invrelurl <- as.data.table(fromJSON(invrelurlWWW)$result)
lifecosts <- as.data.table(fromJSON(lifecostsWWW)$result)
contracts <- as.data.table(fromJSON(contractsWWW)$result)
cioRat <- as.data.table(fromJSON(cioRatWWW)$result)
projects <- as.data.table(fromJSON(projectsWWW)$result)
activities <- as.data.table(fromJSON(actWWW)$result)
perform <- as.data.table(fromJSON(performWWW)$result)
performact <- as.data.table(fromJSON(performactWWW)$result)
invbase <- as.data.table(fromJSON(invbaseWWW)$result)
invTrends <- as.data.table(fromJSON(invTrendsWWW)$result)
agency <- as.data.table(fromJSON(agencyWWW)$result)
bureau <- as.data.table(fromJSON(bureauWWW)$result)
brmcode <- as.data.table(fromJSON(brmcodeWWW)$result)
asoapg <- as.data.table(fromJSON(asoapgWWW)$result)

dts <- c('portfolio', 'provIT', 'infra', 'funding', 'bcase', 'tsol',
         'tsolurl', 'invelim', 'invrelurl', 'lifecosts', 'contracts',
         'cioRat', 'projects', 'activities', 'perform', 'performact',
         'invbase', 'invTrends', 'agency', 'bureau', 'brmcode', 'asoapg')

#-----------------------------------
# Save the data to disc
#-----------------------------------
for (i in dts){
  saveRDS(get(i), file = file.path('data','rds', '2016', i))
}
