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


//plot the graph plot4
png(filename="C:/Users/sadhna/Desktop/plot4.png", width=480, height=480)

# Setting the canvas for 4 plots
par(mfcol=c(2,2))

# First plot
plot(mydata$timestamp, mydata$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# Second plot
plot(mydata$timestamp, mydata$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(mydata$timestamp, mydata$Sub_metering_2, col="red")
lines(mydata$timestamp, mydata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

# Third Plot
plot(mydata$timestamp, mydata$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Fourth plot
plot(mydata$timestamp, mydata$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
