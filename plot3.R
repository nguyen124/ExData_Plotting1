dat <- read.table("household_power_comsumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE,dec=".")
sub <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
date <- strptime(paste(sub$Date,sub$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
convert <- as.numeric(sub$Global_active_power)
metering1 <- as.numeric(sub$Sub_metering_1)
metering2 <- as.numeric(sub$Sub_metering_2)
metering3 <- as.numeric(sub$Sub_metering_3)

png("plot.png",width=480,heigh=480)
plot(date, metering1, type="l", ylab="Energy Submetering", xlab="")
lines(date, metering2, type="l", col="red")
lines(date, metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()