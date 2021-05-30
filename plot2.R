# Read in the dataset
fileName<-"household_power_consumption.txt"
df<-read.table(file=fileName, header=TRUE, sep=";")

# Subset the dataset to the dates of interest
dfSubset<-df[df$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create vectors for the x-variable and the y-variable
activePower<-as.numeric(dfSubset$Global_active_power)
dateTime<-strptime(x=paste(dfSubset$Date, dfSubset$Time, sep=" "), 
                   format="%d/%m/%Y %H:%M:%S")

# Write to a PNG file using a graphics device
png(filename="plot2.png")
plot(x=dateTime, y=activePower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()