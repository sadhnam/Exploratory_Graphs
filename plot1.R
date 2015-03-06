//reading data
 mydata<-read.table("C:/Users/sadhna/Desktop/exdata-data-household_power_consumption/household_power_consumption.txt",
header=TRUE,sep="\t",colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))


//formatting date
mydata$Date = as.Date(mydata$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
mydata= mydata[mydata$Date >= startDate & mydata$Date <= endDate, ]



//create histogram Plot1
png("C:/Users/sadhna/Desktop/graph1.png", width=480, height=480)
hist(mydata$Global_active_power,xlab="Global Active power (kilowatts)", col="red",main="Global Active Power")
dev.off()



