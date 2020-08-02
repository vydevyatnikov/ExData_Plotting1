data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01"&data$Date <= "2007-02-02",]
data$Time <- as.POSIXlt(paste(as.character(data$Date), data$Time, sep = " "), format = "%Y-%m-%d %H:%M:%OS")

#PLOT N1
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power", xaxt = "n")
axis(1, at = c(0,2,4,6))
dev.copy(device = png, file = "plot1.png")
