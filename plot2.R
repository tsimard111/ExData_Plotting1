if(!file.exists("./epc")){dir.create("./epc")}
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "./epc/data.zip")
unzip(zipfile = "./epc/data.zip", exdir = "./epc")
## Read data into R
data <- read.table(header=TRUE, sep=";", stringsAsFactors=FALSE,
                   dec=".", na.strings="?",
                   file="C://users/owner/desktop/rdir/rdir/epc/household_power_consumption.txt")
## Subset to the desired date range
smalldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
## Convert "Date" and "Time" into Posix
datetime <- strptime(paste(smalldata$Date, smalldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
## Initialize png graphics device, plot data with appropriate annotations
png("plot2.png", width=480, height=480)
plot(datetime, smalldata$Global_active_power,
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
## Turn off graphics device
dev.off()
