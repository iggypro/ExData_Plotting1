## Exploratory Data Analysis - Course Project 1
## Plot3 script - June 6th, 2014

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
## https://github.com/iggypro/ExData_Plotting1/blob/master/figure/unnamed-chunk-4.png
createPlot3 <- function(path, startDate="01/02/2007", endDate="02/02/2007")
{
  if(!file.exists(path)) return ("Data file doesn't exist")
  data <- readData(path,startDate,endDate)
  png("plot3.png")
  plot(c(1:length(data$V2)),data$V7,xlab="",ylab="Energy sub metering",type="l",axes=F,
       ylim=c(0,max(data$V7)))
  par(new=T)
  plot(c(1:length(data$V2)),data$V8,xlab="",ylab="",type="l",axes=F,
       col="red",ylim=c(0,max(data$V7)))
  par(new=T)
  plot(c(1:length(data$V2)),data$V9,xlab="",ylab="",type="l",axes=F,
       col="blue",ylim=c(0,max(data$V7)))
  axis(side=1,at=seq(0,length(data$V2),by=1440),labels=c("Thu","Fri","Sat"))
  axis(side=2,at=seq(0,30,by=10))
  box()
  legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c(1,1,1),col=c("black","red","blue"))
  dev.off()
  return("Plot3 has been saved to plot3.png in your working directory")
}

