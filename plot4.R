## PLOT 4
library(dplyr)
# Read txt file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subsetting data
filterData <- filter(data,Date=="1/2/2007" | Date=="2/2/2007")
dateTime <- paste(filterData$Date,filterData$Time,sep=" ")
dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(filterData$Global_active_power)
globalReactivePower <- as.numeric(filterData$Global_reactive_power)
voltage <- as.numeric(filterData$Voltage)
subMetering1 <- as.numeric(filterData$Sub_metering_1)
subMetering2 <- as.numeric(filterData$Sub_metering_2)
subMetering3 <- as.numeric(filterData$Sub_metering_3)
remove(data,filterData)
# Plotting
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) #2x2 graph matrix
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()