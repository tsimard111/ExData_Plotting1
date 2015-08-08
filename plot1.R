## Creates directory, downloads, and unzips source file
if(!file.exists("./epc")){dir.create("./epc")}
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "./epc/data.zip")
unzip(zipfile = "./epc/data.zip", exdir = "./epc")
## Read data into R
data <- read.table(header=TRUE, sep=";", stringsAsFactors=FALSE,
                   dec=".", na.strings="?",
                   file="./epc/household_power_consumption.txt")
## Subset to the desired date range
smalldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
## Launch png graphics device
png("plot1.png", width=480, height=480)
## Plot the histogram with desired color and annotation
hist(smalldata$Global_active_power,
     col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
## Turn off graphics device
dev.off()
