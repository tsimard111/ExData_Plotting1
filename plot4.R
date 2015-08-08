## Creates directory, downloads, and unzips source file
if(!file.exists("./epc")){dir.create("./epc")}
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "./epc/data.zip")
unzip(zipfile = "./epc/data.zip", exdir = "./epc")
## Read data into R
data <- read.table(header=TRUE, sep=";", stringsAsFactors=FALSE,
                   dec=".", na.strings="?",
                   file="C://users/owner/desktop/rdir/rdir/epc/household_power_consumption.txt")
## Subset to the desired date range
smalldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(smalldata$Date, smalldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
## Launch png graphics device
png("plot4.png", width=480, height=480)
## Set configuration of graphs
par(mfrow = c(2, 2)) 
## same as plot 2
plot(datetime, smalldata$Global_active_power,
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
## New plot
plot(datetime, smalldata$Voltage, type="l", xlab="datetime", ylab="Voltage")
## Same as plot 3
plot(datetime, smalldata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, smalldata$Sub_metering_2, type="l", col="red")
lines(datetime, smalldata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2, col=c("black", "red", "blue"))
## Last one!
plot(datetime, smalldata$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")
## Turn off graphics device
dev.off()
