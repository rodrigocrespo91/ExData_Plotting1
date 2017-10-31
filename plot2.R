## PLOT 2
library(dplyr)
# Read txt file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subsetting data
filterData <- filter(data,Date=="1/2/2007" | Date=="2/2/2007")
dateTime <- paste(filterData$Date,filterData$Time,sep=" ")
dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(filterData$Global_active_power)
remove(data,filterData)
# Plotting
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()