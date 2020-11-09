library(tidyverse)
library(DataExplorer)


# read/import data

countyrevenue <- read.csv("Data/Updated County Revenue.csv")
countyrevenue # dataframe!!


# basic functions to understand data munging

  # To understand the dimensions of the data

  dim(countyrevenue)  # checks number of rows and columns
  
  head(countyrevenue)  # shows the first few rows / glimpse of the data
  
  tail(countyrevenue)  # shows the last 
  
  head(countyrevenue, 10) # shows the first 10 rows
  
  # To understand the types of data and structure
  
    # character
    # numeric (real or decimal)
    # integer
    # logical
    # complex
  
    # data descriptives:
  
      class(countyrevenue)
      
      str(countyrevenue)
      
      mean(countyrevenue$Total)
      
      median(countyrevenue$Total)
    
    # tidyverse functions for further descriptives
      
      glimpse(countyrevenue)
      
      # mean(countyrevenue$Total, na.rm = TRUE)
    
      sum(is.na(countyrevenue)) # counts the number of NA/missing cells in the dataframe
      
      sapply(countyrevenue, function(y) sum(length(which(is.na(y))))) # checks the empty cells in each column
      
      plot_str(countyrevenue) # plots tree diagram of the data frame
      
      plot_missing(countyrevenue)
    
      plot_histogram(countyrevenue)
      
      plot_bar(head(countyrevenue, 30))
    
      
      create_report(countyrevenue)
    
        plot_intro(countyrevenue)
        
        plot_histogram(countyrevenue)
        
        plot_density(countyrevenue)
        
        plot_scatterplot(countyrevenue)
        
    

























