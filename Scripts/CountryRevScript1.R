library(easypackages)
library(lubridate)
library(tidyverse)
library(ggrepel)


#Read/import data
countyrevenue <- read.csv("Data/Updated County Revenue.csv")
countyrevenue # dataframe!!

# Set GGplot theme
theme_set(theme_minimal())


# basic functions to understand data munging

  # To understand the dimensions of the data
dim(countyrevenue)  # checks number of rows and columns
head(countyrevenue)  # shows the first few rows / glimpse of the data
tail(countyrevenue)  # shows the last 
head(countyrevenue, 10) # shows the first 10 rows
  
# To understand the types of data and structures ####
  
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

# tidyverse functions for further descriptives ####
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


# Duplicate the Year Column
countyrevenue$year = countyrevenue$Year

# Convert Year Factor to Date format
lubridate::ymd(countyrevenue$YearFactor, truncated = 2L)
countyrevenue$YearFactor <- ymd(sprintf("%d-01-01",countyrevenue$YearFactor))
countyrevenue$YearFactor <- strptime(as.character(countyrevenue$YearFactor), "%Y")
countyrevenue$year <- strptime(countyrevenue$year,"%Y")
countyrevenue$year <- format(countyrevenue$year,"%Y")
countyrevenue$year <- yea
# # Convert Year to Factor
# to_factor <- c("YearFactor")
# for (col in to_factor) {
#   countyrevenue[[col]] <- as.factor(as.integer(countyrevenue[[col]]))
# }
# 
# # Ordered List
# countyrevenue$YearFactor <- factor(countyrevenue$Year, levels = c("2014","2015","2016","2017","2018"), ordered = T)


# Mutate Target and Total Revenue Column
countyrevenue <- countyrevenue %>%
  mutate(TotalRevenue = round(Total/1000000000,1)) %>%
  mutate(TargetRevenue = round(Target/1000000000,1))


# Time Series Graphs ####
countyrevenue %>%
  filter(County == "Nairobi") %>%
  ggplot(aes(x=Year, y=TotalRevenue)) + 
  geom_line(color = "#00AFBB")


# Create a Line graph for Nairobi over the year
countyrevenue %>%
  filter(County == "Nairobi") %>%
  mutate(TotalRevenue = round(Total/1000000000,1)) %>%
  mutate(TargetRevenue =round(Target/1000000000,1)) %>%
  ggplot() + 
  geom_line(aes(x=Year, y=TotalRevenue, color="Total Revenue")) +
  geom_line(aes(x=Year, y=TargetRevenue, color="Target Revenue"),linetype="F1") + 
  geom_point() + 
  labs(y = "Revenue in Billions")

















