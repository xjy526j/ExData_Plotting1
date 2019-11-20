# load data

data <- read.table("./data/household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
d <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
datetime <- as.POSIXct(datetime)
d <- cbind(datetime, d)

# plot 2
png(file = "plot2.png", width=480, height=480)
plot(d$datetime, d$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
