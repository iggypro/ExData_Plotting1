## Exploratory Data Analysis - Course Project 1
## Plot2 script - June 6th, 2014

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
## https://github.com/iggypro/ExData_Plotting1/blob/master/figure/unnamed-chunk-3.png
createPlot2 <- function(path, startDate="01/02/2007", endDate="02/02/2007")
{
  if(!file.exists(path)) return ("Data file doesn't exist")
  data <- readData(path,startDate,endDate)
  png("plot2.png")
  plot(c(1:length(data$V2)),data$V3,xlab="",ylab="Global Active Power (kilowatts)",type="l",axes=F)
  axis(side=1,at=seq(0,length(data$V2),by=1440),labels=c("Thu","Fri","Sat"))
  axis(side=2,at=seq(0,6,by=2))
  box()
  dev.off()
  return("Plot2 has been saved to plot2.png in your working directory")
}


