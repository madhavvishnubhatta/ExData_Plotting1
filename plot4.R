setwd ("C:\\Users\\mvishnubhatta\\Documents\\data\\")
fileName <- "household_power_consumption.txt"
dt <- read.table(fileName, header=TRUE, sep=";", na.strings = "?")
dt[,1] <- as.Date(dt[,1],"%d/%m/%Y")
sdt <- subset(dt,(dt[,1] ==  as.Date("2007-02-01")) | (dt[,1] == as.Date("2007-02-02")))
par(mfrow=c(2,2))
plot(strptime(paste(sdt$Date,sdt$Time,sep= " "),format = "%Y-%m-%d %H:%M:%S"),sdt$Global_active_power, type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
plot(strptime(paste(sdt$Date,sdt$Time,sep= " "),format = "%Y-%m-%d %H:%M:%S"),sdt$Voltage, type="l",xlab = "",ylab = "Voltage")
plot(strptime(paste(sdt$Date,sdt$Time,sep= " "),format = "%Y-%m-%d %H:%M:%S"),sdt$Sub_metering_1, type="l",xlab = "",ylab = "Energy Sub Metering")
lines(strptime(paste(sdt$Date,sdt$Time,sep= " "),format = "%Y-%m-%d %H:%M:%S"),sdt$Sub_metering_2, col="red")
lines(strptime(paste(sdt$Date,sdt$Time,sep= " "),format = "%Y-%m-%d %H:%M:%S"),sdt$Sub_metering_3, col="blue")
legend("topright", pch = 1, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1)
plot(strptime(paste(sdt$Date,sdt$Time,sep= " "),format = "%Y-%m-%d %H:%M:%S"),sdt$Global_reactive_power, type="l",xlab = "",ylab = "Global_Reactive_Power")
dev.copy(png, file="plot4.png")
dev.off()
