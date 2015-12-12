fileName <- "household_power_consumption.txt"
dt <- read.table(fileName, header=TRUE, sep=";", na.strings = "?")
dt[,1] <- as.Date(dt[,1],"%d/%m/%Y")
sdt <- subset(dt,(dt[,1] ==  as.Date("2007-02-01")) | (dt[,1] == as.Date("2007-02-02")))
plot(strptime(paste(sdt$Date,sdt$Time,sep= " "),format = "%Y-%m-%d %H:%M:%S"),sdt$Global_active_power, type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()
