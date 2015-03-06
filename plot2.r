//reading data
 mydata<-read.table("C:/Users/sadhna/Desktop/exdata-data-household_power_consumption/household_power_consumption.txt",
header=TRUE,sep="\t",colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))



//formatting date
mydata$timestamp = strptime(paste(mydata$Date,mydata$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
mydata = mydata[mydata$timestamp >= startDate & mydata$timestamp <= endDate, ]


## Creating the plot2
png(filename="C:/Users/sadhna/Desktop/plot2.png", width=480, height=480)
plot(mydata$timestamp, mydata$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
