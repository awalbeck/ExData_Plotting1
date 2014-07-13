#----------------------------------------------------------------------------------------
# Miscellaneous Setup
#----------------------------------------------------------------------------------------

# Go to my Home Directory, then grab data out of folder and read it in
setwd("C:/Users/Alan/Documents/Data Science Course (Coursera)/Electric Power")
setwd("C:/Users/Alan/Documents/Data Science Course (Coursera)")
PowerData <- read.table ("Electric Power/household_power_consumption.txt",sep=";",na.strings=c("?","NA"),header=TRUE)

#----------------------------------------------------------------------------------------
# Plot 2
#----------------------------------------------------------------------------------------
PowerData$Date2 <- as.POSIXct(paste(PowerData$Date, PowerData$Time), format="%d/%m/%Y %H:%M:%S")
PowerData$Date <- strptime(as.character(PowerData$Date), "%d/%m/%Y")
PowerData$Date <- as.Date(PowerData$Date)
Power <- subset (PowerData, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

# Plot 2
png(file="plot2.png")
plot(Power$Date2, Power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
