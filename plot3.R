data <- read.table("data/household_power_consumption.txt", header=TRUE, 
                   sep=";", stringsAsFactors=FALSE)
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S")
data <- data[as.Date(data$Time) <= '2007-02-02' & 
               as.Date(data$Time) >= '2007-02-01', ]
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png(file = "ExData_Plotting1/plot3.png")
plot(data$Time, data$Sub_metering_1, type="l", xlab='', 
     ylab='Energy sub metering ')
lines(data$Time, data$Sub_metering_2, col='red')
lines(data$Time, data$Sub_metering_3, col='blue')
legend('topright', lty='solid', col=c('black', 'red', 'blue'), 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()