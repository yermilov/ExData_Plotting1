data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings = '?')
data <- data[data[, 'Date'] == '1/2/2007' | data[, 'Date'] == '2/2/2007', ]
data$'Datetime' <- strptime(paste(data$'Date', data$'Time'), format = "%d/%m/%Y %H:%M:%S")

plot(data$Datetime, data$Global_active_power, type = 'n', xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$Datetime, data$Global_active_power, type = 's')

dev.copy(png, file = "plot2.png") 
dev.off()
