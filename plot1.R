data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings = '?')
data <- data[data[, 'Date'] == '1/2/2007' | data[, 'Date'] == '2/2/2007', ]
data$'Datetime' <- strptime(paste(data$'Date', data$'Time'), format = "%d/%m/%Y %H:%M:%S")

hist(data$'Global_active_power', col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))

dev.copy(png, file = "plot1.png") 
dev.off()
