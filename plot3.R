setwd("C:/Users/cbsta/Documents/Coursera/Exploratory Data Analysis")

## read in full data set

elecdat<-read.delim("household_power_consumption.txt", header=TRUE,
                    sep=";", dec=".", na.strings="?")

## keep data from Feb 1, 2, 2007

feb12dat<-elecdat[elecdat$Date %in% c("1/2/2007", "2/2/2007"), ]

## create date time variable
dtime<-paste(feb12dat$Date, feb12dat$Time)

y<-strptime(dtime, "%d/%m/%Y %H:%M:%S")

## open png file
png("plot3.png")

## creat overlayed line plot
plot(y, feb12dat$Sub_metering_1, type="l", col="black",
     ylab="Energy sub metering", xlab=" ")
lines(y, feb12dat$Sub_metering_2, type="l", col="red")
lines(y, feb12dat$Sub_metering_3, type="l", col="blue")
 legend("topright", legend=c("Sub_metering_1", "Sub_metering_2",
                             "Sub_metering_3"), lwd=2,
        col=c("black", "red", "blue"),
        text.col=c("black", "red", "blue"))
 

## close png device
dev.off()
