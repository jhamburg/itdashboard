updVarNames <- function(vect){
  stopifnot(is.character(vect))

  lookup <- c(
    'Exhibit53A' = 'portfolio',
    'ITPortfolio' = 'portfolio',
    'Exhibit53_Funding_Sources' = 'funding',
    'ITPortfolio_Funding_Sources' = 'funding',
    'CloudSpendingSummary' = 'provIT',
    'Exhibit53C' = 'provIT',
    'IT_Infrastructure_Spending' = 'infra',
    'BusinessCase' = 'bcase',
    'Exhibit300A' = 'bcase',
    'Technical_Solutions_Requirements' = 'tsol',
    'Technical_Solutions_Requirements_URLs' = 'tsolurl',
    'Investments_Eliminated_Reduced' = 'invelim',
    'Investment_Related_URLs' = 'invrelurl',
    'Life_Cycle_Costs' = 'lifecosts',
    'Contracts' = 'contracts',
    'CIO_Evaluation_History' = 'cioRat',
    'Projects' = 'projects',
    'Activities' = 'activities',
    'Performance_Metrics' = 'perform',
    'Performance_Metrics_Actuals' = 'performact',
    'Investment_Baseline_History' = 'invbase',
    'Investment_Trends' = 'invTrends',
    'Agency' = 'agency',
    'Bureau' = 'bureau'
  )
  
  res <- lookup[vect]
  
  return(res)
}
