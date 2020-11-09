library(tidyverse)
library(DataExplorer)


# read/import data

countyrevenue <- read.csv("Data/Updated County Revenue2noNA.csv")
# countyrevenue # dataframe!!

sERevenue <- countyrevenue %>% filter(County %in% c("Machakos","Makueni","Kitui"))
head(sERevenue)

plot(sERevenue)

plot(sERevenue$FirstQuarter)
plot(sERevenue$Target, sERevenue$Total)

plot(sERevenue$Target, sERevenue$Total,
     col = "#6DA34D",
     pch = 19,
     main = "Target vs Total",
     xlab = "Target Revenue",
     ylab = "Total Revenue"
     )

plot(dnorm, -3, +3,
     col = "#cc0000",
     lwd = 5,
     main = "Target vs Total",
     xlab = "Target Revenue",
     ylab = "Total Revenue"
     )

plot_density(sERevenue$Target, sERevenue$Total)

ts(data = sERevenue, 
   start = 2015, 
   end = 2018,
   frequency = 3
   
   )


