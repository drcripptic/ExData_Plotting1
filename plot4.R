data <- read.table("data/household_power_consumption.txt", header=TRUE, 
                   sep=";", stringsAsFactors=FALSE)
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S")
data <- data[as.Date(data$Time) <= '2007-02-02' & 
               as.Date(data$Time) >= '2007-02-01', ]
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png(file = "ExData_Plotting1/plot4.png")
par(mfrow=c(2,2))
with(data, {
  plot(data$Time, data$Global_active_power, type="l", xlab='', 
       ylab='Global Active Power')
  plot(data$Time, data$Voltage, type="l", xlab='datetime', 
       ylab='Voltage')
  plot(data$Time, data$Sub_metering_1, type="l", xlab='', 
       ylab='Energy sub metering ')
  lines(data$Time, data$Sub_metering_2, col='red')
  lines(data$Time, data$Sub_metering_3, col='blue')
  legend('topright', lty='solid', col=c('black', 'red', 'blue'), 
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  plot(data$Time, data$Global_active_power, type="l", xlab='datetime', 
       ylab='Global_reactive_power')
})
dev.off()