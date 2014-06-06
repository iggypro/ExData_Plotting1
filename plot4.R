## Exploratory Data Analysis - Course Project 1
## Plot4 script - June 6th, 2014

## Reading data from "Electric Power Consumption" source
readData <- function(path, startDate="01/02/2007", endDate="02/02/2007")
{
  skipRows <- as.numeric(
    difftime(as.Date(startDate,format="%d/%m/%Y"),
             as.Date("17/12/2006",format="%d/%m/%Y"),
             units="days"),
    units="days")*1440 + 396 + 1
  
  readRows <- as.numeric(
    difftime(as.Date(endDate,format="%d/%m/%Y"),
             as.Date(startDate,format="%d/%m/%Y"),
             units="days"),
    units="days")*1440 + 1440
  
  return(read.table(path,sep=";",nrows=readRows,skip=skipRows,na.strings="?"))
}

## Creating a plot similar to
## https://github.com/iggypro/ExData_Plotting1/blob/master/figure/unnamed-chunk-5.png
createPlot4 <- function()
{
  
}

