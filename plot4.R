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
createPlot4 <- function(path, startDate="01/02/2007", endDate="02/02/2007")
{
  if(!file.exists(path)) return ("Data file doesn't exist")
  data <- readData(path,startDate,endDate)
  png("plot4.png")
  
  ##create 2x2 layout
  par(mfrow=c(2,2))
  
  ##create plot 1/4
  plot(c(1:length(data$V2)),data$V3,xlab="",ylab="Global Active Power",type="l",axes=F)
  axis(side=1,at=seq(0,length(data$V2),by=1440),labels=c("Thu","Fri","Sat"))
  axis(side=2,at=seq(0,6,by=2))
  box()
  
  ##create plot 2/4
  plot(c(1:length(data$V2)),data$V5,xlab="datetime",ylab="Voltage",type="l",axes=F)
  axis(side=1,at=seq(0,length(data$V2),by=1440),labels=c("Thu","Fri","Sat"))
  axis(side=2,at=seq(234,246,by=2))
  box()
  
  ##create plot 3/4
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
         lty=c(1,1,1),col=c("black","red","blue"),bty="n",cex=1)
  
  ##create plot 4/4
  plot(c(1:length(data$V2)),data$V4,xlab="datetime",ylab="Global_reactive_power",type="l",axes=F)
  axis(side=1,at=seq(0,length(data$V2),by=1440),labels=c("Thu","Fri","Sat"))
  axis(side=2,at=seq(0.0,0.5,by=0.1))
  box()
  
  dev.off()
  return("Plot4 has been saved to plot4.png in your working directory")
}

