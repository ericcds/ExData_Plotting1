## read in the text file and use SQL to select only 2 dates
hcp1 <- read.csv.sql("household_power_consumption.txt",sql="select * from file where Date in ('1/2/2007','2/2/2007')", header=TRUE, sep=';');

## point the device to a png file

png("plot1.png", width=480, height=480)

#plot the histogram
hist(hcp1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts")

dev.off()