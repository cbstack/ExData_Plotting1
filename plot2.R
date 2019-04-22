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
png("plot2.png")

## create line plot
with (feb12dat, plot(y, feb12dat$Global_active_power, type="l",
      ylab="Global Active Power (kilowatts)", xlab=" "))

## close png device
dev.off()
