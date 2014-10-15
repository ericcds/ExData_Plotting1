## read in the text file and use SQL to select only 2 dates
hcp1 <- read.csv.sql("household_power_consumption.txt",sql="select * from file where Date in ('1/2/2007','2/2/2007')", header=TRUE, sep=';');

# add a column for weekdays - the weekday function doesn't work
#hcp2 <- cbind("Weekday"=ifelse(hcp1$Date=='1/2/2007',"Thu","Fri"),hcp1[])
#hcp2 <- cbind("Datetime"=c(hcp2$Date, hcp2$Time),hcp2[])

# add a column for combined datetime

hcp2 <- cbind("Datetime"=strptime(paste(hcp1$Date,hcp1$Time),"%d/%m/%Y %H:%M:%S"),hcp1[])

# build the plot

png("plot3.png", width=480, height=480)

## create an empty plot
plot(hcp2$Datetime,hcp2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering") 

## add line for sub_metering_1 in black
lines(hcp2$Datetime,hcp2$Sub_metering_1,col="black")

## add line for sub_metering_2 in red
lines(hcp2$Datetime,hcp2$Sub_metering_2,col="red")

## add line for sub_metering_3 in blue
lines(hcp2$Datetime,hcp2$Sub_metering_3,col="blue")

## add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.off()