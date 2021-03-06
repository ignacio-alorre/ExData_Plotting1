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

attach(energyRelevant)

#Plot 2 
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

#Storing the png file generated
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

detach(energyRelevant)
