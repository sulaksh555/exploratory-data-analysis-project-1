# Read in the dataset
fileName<-"household_power_consumption.txt"
df<-read.table(file=fileName, header=TRUE, sep=";")

# Subset the dataset to the dates of interest
dfSubset<-df[df$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create a vector for the x-variable
activePower<-as.numeric(dfSubset$Global_active_power)

# Write to a PNG file via a graphics device
png(filename="plot1.png")
hist(x=activePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()