## reading data and subsetting
pcs<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
pcss<-subset(pcs,Date=="1/2/2007"|Date=="2/2/2007")
rm(pcs)
## converting Global_active_power 
pcss$Global_active_power<-as.numeric(pcss$Global_active_power)/1000
## creating contnuous date object for the 2 days
datetime <- strptime(paste(pcss$Date, pcss$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
## plot on screen
plot(datetime,pcss$Global_active_power,type="l",lwd=1,xlab="",ylab="Global Active Power (kilowatts)")
## plot on png and close devise
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off() 