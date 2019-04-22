setwd("C:/Users/cbsta/Documents/Coursera/Exploratory Data Analysis")

## read in full data set

elecdat<-read.delim("household_power_consumption.txt", header=TRUE,
                    sep=";", dec=".", na.strings="?")

## keep data from Feb 1, 2, 2007

elecdat<-elecdat[elecdat$Date %in% c("1/2/2007", "2/2/2007"), ]

## open png file
png("plot1.png")

## definte plotting area in order to have y-axis labels
par(pin=c(4, 4))

## make histogram
hist(elecdat$Global_active_power, col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

## close png device
dev.off()
