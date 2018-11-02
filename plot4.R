#Reading the data which first row is the name of the features. Columns are separated by ";" 
#and missing values are written with "?"
energy  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Conversting Data feature from its d/m/Y format into Date type
energy$Date <- as.Date(energy$Date, format = "%d/%m/%Y")

#Subsetting the interval of time requested: [2007-02-01, 2007-02-02]
energyRelevant <- energy[energy$Date >= "2007-02-01" & energy$Date <= "2007-02-02",]


#Merging the date and time features into a single one
energyRelevant$datetime <- strptime(paste(energyRelevant$Date, energyRelevant$Time), "%Y-%m-%d %H:%M:%S")

#Casting the datatime feature
energyRelevant$datetime <- as.POSIXct(energyRelevant$datetime)


#Plot 4

#Preparing a 2X2 view
par(mfrow = c(2, 2))

#First subplot
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = "", cex=0.2)

#Second subplot
plot(Voltage ~ datetime, type = "l", cex=0.2)

#Third subplot
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "", cex=0.2)
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = c(1, 1, 1, 1), lwd=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty= "n",
       y.intersp=0.4, inset = c(0.15,0,0.15,0))


#Fourth subplot
plot(Global_reactive_power ~ datetime, type = "l", cex=0.2)

#Saving the results in a png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
