data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings = '?')
data <- data[data[, 'Date'] == '1/2/2007' | data[, 'Date'] == '2/2/2007', ]
data$'Datetime' <- strptime(paste(data$'Date', data$'Time'), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

plot(data$Datetime, data$Global_active_power, type = 'n', xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$Datetime, data$Global_active_power, type = 's')

plot(data$Datetime, data$Voltage, type = 'n', xlab = "datetime", ylab = "Voltage")
lines(data$Datetime, data$Voltage, type = 's')

plot(data$Datetime, data$Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_1, type = 's')
lines(data$Datetime, data$Sub_metering_2, type = 's', col = 'red')
lines(data$Datetime, data$Sub_metering_3, type = 's', col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), cex = 0.2)

plot(data$Datetime, data$Global_reactive_power, type = 'n', xlab = "datetime", ylab = "Global_reactive_power")
lines(data$Datetime, data$Global_reactive_power, type = 's')

dev.copy(png, file = "plot4.png") 
dev.off()
