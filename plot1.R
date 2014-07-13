#----------------------------------------------------------------------------------------
# Miscellaneous Setup
#----------------------------------------------------------------------------------------

# Go to my Home Directory, then grab data out of folder and read it in
setwd("C:/Users/Alan/Documents/Data Science Course (Coursera)/Electric Power")
setwd("C:/Users/Alan/Documents/Data Science Course (Coursera)")
PowerData <- read.table ("Electric Power/household_power_consumption.txt",sep=";",na.strings=c("?","NA"),header=TRUE)

#----------------------------------------------------------------------------------------
# Plot 1
#----------------------------------------------------------------------------------------
PowerData$Date <- strptime(as.character(PowerData$Date), "%d/%m/%Y")
PowerData$Date <- as.Date(PowerData$Date)
head(PowerData)
head(Power)
Power <- subset (PowerData, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

# Plot 1
png(file="plot1.png")
hist(Power$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
