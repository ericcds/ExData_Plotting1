## read in the text file and use SQL to select only 2 dates
hcp1 <- read.csv.sql("household_power_consumption.txt",sql="select * from file where Date in ('1/2/2007','2/2/2007')", header=TRUE, sep=';')

# add a column for combined datetime

hcp2 <- cbind("Datetime"=strptime(paste(hcp1$Date,hcp1$Time),"%d/%m/%Y %H:%M:%S"),hcp1[])

# build the plot

png("plot4.png", width=480, height=480)

## set 4 plots per page 2 across and 2 down by rows
par(mfrow=c(2,2))

##set margins to 2, 2, 1, 1
par(mar=c(2,2,1,1))

## plot global active power across datetime as a line
plot(hcp2$Datetime,hcp2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)") 

## plot Voltage across datetime as a line
plot(hcp2$Datetime,hcp2$Voltage,type="l",ylab="Voltage",xlab="datetime")

## plot energy sub metering with 3 lines for 1, 2 & 3 across datetime
## blank plot first
plot(hcp2$Datetime,hcp2$Sub_metering_1,type="n",ylab="Global sub metering",xlab="")

## add line 1 Sub_metering_1 in black
lines(hcp2$Datetime,hcp2$Sub_metering_1,col="black")

## add line 2 Sub_metering_2 in red
lines(hcp2$Datetime,hcp2$Sub_metering_2,col="red")

## add line 3 Sub_metering_3 in blue
lines(hcp2$Datetime,hcp2$Sub_metering_3,col="blue")

## add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

## plot global reactive power across datetime
plot(hcp2$Datetime,hcp2$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

## close the png graphics device
dev.off()