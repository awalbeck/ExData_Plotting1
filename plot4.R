#----------------------------------------------------------------------------------------
# Miscellaneous Setup
#----------------------------------------------------------------------------------------

# Go to my Home Directory, then grab data out of folder and read it in
setwd("C:/Users/Alan/Documents/Data Science Course (Coursera)/Electric Power")
setwd("C:/Users/Alan/Documents/Data Science Course (Coursera)")
PowerData <- read.table ("Electric Power/household_power_consumption.txt",sep=";",na.strings=c("?","NA"),header=TRUE)

#----------------------------------------------------------------------------------------
# Plot 4
#----------------------------------------------------------------------------------------
PowerData$Date2 <- as.POSIXct(paste(PowerData$Date, PowerData$Time), format="%d/%m/%Y %H:%M:%S")
PowerData$Date <- strptime(as.character(PowerData$Date), "%d/%m/%Y")
PowerData$Date <- as.Date(PowerData$Date)
Power <- subset (PowerData, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

# Plot 4
png(file="plot4.png")
par(mfrow=c(2,2), mar=c(4,4,4,2))

# Plot 4a
plot(Power$Date2, Power$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 4b
plot(Power$Date2, Power$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 4c
with(Power, plot(Power$Date2, Power$Sub_metering_1, type="n", xlab ="", ylab="Energy sub metering"))

lines(Power$Date2, Power$Sub_metering_1, col="black")
lines(Power$Date2, Power$Sub_metering_2, col="red")
lines(Power$Date2, Power$Sub_metering_3, col="blue")

legend("topright", pch="_", col=c("black","red","blue"), bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot 4d
plot(Power$Date2, Power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()






