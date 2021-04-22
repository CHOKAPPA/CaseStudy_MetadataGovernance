#Simulation - Data
Transactions <- rpois(30, lambda = Transactions_Count)
DefectsInPPM <- round(rnorm(30, 
                            mean = Transactions_DefectsInPPM_Avg,
                            sd   = Transactions_DefectsInPPM_Std))
Date         <- seq(as.Date('2021-01-01'),length.out = 30, by = 'day') 
dbGovernance <- data.frame(Date, Transactions, DefectsInPPM)

#Simulation - Failures Injected
dbGovernance$DefectsInPPM[11] <- 241

library(qicharts)

#Simulation - Parameters
Transactions.Count       <- 1000 
Transactions.DefectsInPPM.Avg <- 178
Transactions.DefectsInPPM.Std <- 19

#Simulation - Data
Transactions <- rpois(30, lambda = Transactions.Count)
DefectsInPPM <- round(rnorm(30, mean = Transactions.DefectsInPPM.Avg, sd = Transactions.DefectsInPPM.Std))
Date         <- seq(as.Date('2021-01-01'),length.out = 30, by = 'day') 
dbGovernance <- data.frame(Date, Transactions, DefectsInPPM)

#Simulation - Failures Injected
dbGovernance$DefectsInPPM[11] <- 241

# Plot I-Chart of Governance
qic(y = dbGovernance$DefectsInPPM,
    x = dbGovernance$Date,
    chart = 'i',
    main  = 'Data Governance (I-Chart)',
    ylab  = 'Defects in PPM',
    xlab  = 'Transaction Date')
