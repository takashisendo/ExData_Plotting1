## reading data and subsetting
pcs<-read.csv("household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?")
pcss<-subset(pcs,Date=="1/2/2007"|Date=="2/2/2007")
rm(pcs)
## creating contnuous date object for the 2 days
datetime <- strptime(paste(pcss$Date, pcss$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
## plot on screen
## Plot 3
plot(datetime,pcss$Sub_metering_1,type="l",lwd=1,xlab="",ylab="Global Active Power (kilowatts)")
with(pcss, {
  plot(datetime, pcss$Sub_metering_1,type="l",
       ylab="Energy sub metering", xlab="")
  lines(datetime,pcss$Sub_metering_2,col='Red')
  lines(datetime,pcss$Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))## plot on png and close devise
## saving files
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off() 