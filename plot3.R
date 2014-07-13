#----------------------------------------------------------------------------------------
# Miscellaneous Setup
#----------------------------------------------------------------------------------------

# Go to my Home Directory, then grab data out of folder and read it in
setwd("C:/Users/Alan/Documents/Data Science Course (Coursera)/Electric Power")
setwd("C:/Users/Alan/Documents/Data Science Course (Coursera)")
PowerData <- read.table ("Electric Power/household_power_consumption.txt",sep=";",na.strings=c("?","NA"),header=TRUE)

#----------------------------------------------------------------------------------------
# Plot 3
#----------------------------------------------------------------------------------------
PowerData$Date2 <- as.POSIXct(paste(PowerData$Date, PowerData$Time), format="%d/%m/%Y %H:%M:%S")
PowerData$Date <- strptime(as.character(PowerData$Date), "%d/%m/%Y")
PowerData$Date <- as.Date(PowerData$Date)
Power <- subset (PowerData, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

# Plot 3
png(file="plot3.png")
with(Power, plot(Power$Date2, Power$Sub_metering_1, type="n", xlab ="", ylab="Energy sub metering"))

lines(Power$Date2, Power$Sub_metering_1, col="black")
lines(Power$Date2, Power$Sub_metering_2, col="red")
lines(Power$Date2, Power$Sub_metering_3, col="blue")

legend("topright", pch="_", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
