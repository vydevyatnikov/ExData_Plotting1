data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01"&data$Date <= "2007-02-02",]
data$Time <- as.POSIXlt(paste(as.character(data$Date), data$Time, sep = " "), format = "%Y-%m-%d %H:%M:%OS")

# PLOT N2
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(device = png, file = "plot2.png")