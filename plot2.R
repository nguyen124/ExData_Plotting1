dat <- read.table("household_power_comsumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE,dec=".")
sub <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
date <- strptime(paste(sub$Date,sub$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
convert <- as.numeric(sub$Global_active_power)
png("plot2.png",width=480,heigh=480)
plot(date, convert, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()