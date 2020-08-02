data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01"&data$Date <= "2007-02-02",]
data$Time <- as.POSIXlt(paste(as.character(data$Date), data$Time, sep = " "), format = "%Y-%m-%d %H:%M:%OS")

#PLOT N3
png(filename = "plot3.png")
plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data[,c(2,8)], col = "red")
lines(data[,c(2,9)], col = "blue")
lines(data[,c(2,7)])
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))