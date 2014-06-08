data <- read.table("data/household_power_consumption.txt", header=TRUE, 
                   sep=";", stringsAsFactors=FALSE)
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S")
data <- data[as.Date(data$Time) <= '2007-02-02' & 
               as.Date(data$Time) >= '2007-02-01', ]
data$Global_active_power <- as.numeric(data$Global_active_power)

png(file = "ExData_Plotting1/plot1.png")
hist(data$Global_active_power, xlab='Global Active Power (kilowatts)', 
     main='Global Active Power', col='red')
dev.off()