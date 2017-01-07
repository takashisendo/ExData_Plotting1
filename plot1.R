## reading data and subsetting
pcs<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
pcss<-subset(pcs,Date=="1/2/2007"|Date=="2/2/2007")
rms(pcs)
## converting Global_active_power to numeri
pcss$Global_active_power<-as.numeric(pcss$Global_active_power)/1000
## print on screen
hist(pcss$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequencies")
## create a png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off() 