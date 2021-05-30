# Read in the dataset
fileName<-"household_power_consumption.txt"
df<-read.table(file=fileName, header=TRUE, sep=";")

# Subset the dataset to the dates of interest
dfSubset<-df[df$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create vectors for the x-variable and the y-variable
activePower<-as.numeric(dfSubset$Global_active_power)
reactivePower<-as.numeric(dfSubset$Global_reactive_power)
voltage<-as.numeric(dfSubset$Voltage)
dateTime<-strptime(x=paste(dfSubset$Date, dfSubset$Time, sep=" "), 
                   format="%d/%m/%Y %H:%M:%S")
subMetering1<-as.numeric(dfSubset$Sub_metering_1)
subMetering2<-as.numeric(dfSubset$Sub_metering_2)
subMetering3<-as.numeric(dfSubset$Sub_metering_3)

# Write to a PNG file using a graphics device
png(filename="plot4.png", height=480, width=480)
par(mfrow=c(2, 2))

plot(x=dateTime, y=activePower, type="l", xlab="", ylab="Global Active Power")

plot(x=dateTime, y=voltage, type="l", xlab="datetime", ylab="Voltage")

plot(x=dateTime, y=subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(x=dateTime, y=subMetering2, type="l", col="red")
lines(x=dateTime, y=subMetering3, type="l", col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", 
                              "Sub_metering_3"), lty=1, 
       col=c("black", "red", "blue"))

plot(x=dateTime, y=reactivePower, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()
