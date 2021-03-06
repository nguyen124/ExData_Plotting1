dat <- read.table("household_power_comsumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE,dec=".")
sub <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
date <- strptime(paste(sub$Date,sub$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

metering1 <- as.numeric(sub$Sub_metering_1)
metering2 <- as.numeric(sub$Sub_metering_2)
metering3 <- as.numeric(sub$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(date, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(date, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date, metering1, type="l", ylab="Energy Submetering", xlab="")
lines(date, metering2, type="l", col="red")
lines(date, metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(date, globalReactivePower , type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()