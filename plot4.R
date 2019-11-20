# load data

data <- read.table("./data/household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
d <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
datetime <- as.POSIXct(datetime)
d <- cbind(datetime, d)

# plot 4
png(file = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(d$datetime, d$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
plot(d$datetime, d$Voltage, type = "l", xlab = "", ylab="Voltage(volt)")
with(d, {
  plot(datetime, Sub_metering_1, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)", col = "black")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
})
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1))
plot(d$datetime, d$Global_reactive_power, type = "l", xlab = "", ylab="Global Rective Power (kilowatts)")
dev.off()