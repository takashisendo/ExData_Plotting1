## reading data and subsetting
pcs<-read.csv("household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?")
pcss<-subset(pcs,Date=="1/2/2007"|Date=="2/2/2007")
rm(pcs)
## creating contnuous date object for the 2 days
datetime <- strptime(paste(pcss$Date, pcss$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
## Plot 4 on screen
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
# plot 4-1
plot(datetime,pcss$Global_active_power,type="l",lwd=1,xlab="",ylab="Global Active Power")
## plot 4-2
plot(datetime,pcss$Voltage,type="l",lwd=1,xlab="datetime",ylab="Voltage")
## plot 4-3
with(pcss, {
  plot(datetime, pcss$Sub_metering_1,type="l",
       ylab="Energy sub metering", xlab="")
  lines(datetime,pcss$Sub_metering_2,col='Red')
  lines(datetime,pcss$Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.5)## plot on png and close devise
## plot 4-4
plot(datetime,pcss$Global_reactive_power,type="l",lwd=1,xlab="datetime",ylab="Global_reactive_power")

## saving files
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off() 

## resetting mfrow
par(mfrow=c(1,1))