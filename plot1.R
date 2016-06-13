dat <- read.table("household_power_comsumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE,dec=".")
sub <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
png("plot1.png",width=480,heigh=480)
convert <- as.numeric(sub$Global_active_power)
hist(convert,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()