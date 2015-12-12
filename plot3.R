fileName <- "household_power_consumption.txt"
dt <- read.table(fileName, header=TRUE, sep=";", na.strings = "?")
dt[,1] <- as.Date(dt[,1],"%d/%m/%Y")
sdt <- subset(dt,(dt[,1] ==  as.Date("2007-02-01")) | (dt[,1] == as.Date("2007-02-02")))
plot(strptime(paste(sdt$Date,sdt$Time,sep= " "),format = "%Y-%m-%d %H:%M:%S"),sdt$Sub_metering_1, type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(strptime(paste(sdt$Date,sdt$Time,sep= " "),format = "%Y-%m-%d %H:%M:%S"),sdt$Sub_metering_2, col="red")
lines(strptime(paste(sdt$Date,sdt$Time,sep= " "),format = "%Y-%m-%d %H:%M:%S"),sdt$Sub_metering_3, col="blue")
legend("topright", pch = 1, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1)
dev.copy(png, file="plot3.png")
dev.off()
