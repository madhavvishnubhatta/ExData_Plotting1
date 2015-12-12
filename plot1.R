fileName <- "household_power_consumption.txt"
dt <- read.table(fileName, header=TRUE, sep=";", na.strings = "?")
dt[,1] <- as.Date(dt[,1],"%d/%m/%Y")
sdt <- subset(dt,(dt[,1] ==  as.Date("2007-02-01")) | (dt[,1] == as.Date("2007-02-02")))
sdt[,2] <- strptime(sdt[,2], "%H:%M:%S")
hist(sdt$Global_active_power, col="red", ylab = "Frequency", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()
