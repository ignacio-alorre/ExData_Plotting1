#Reading the data which first row is the name of the features. Columns are separated by ";" 
#and missing values are written with "?"
energy  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Conversting Data feature from its d/m/Y format into Date type
energy$Date <- as.Date(energy$Date, format = "%d/%m/%Y")

#Subsetting the interval of time requested: [2007-02-01, 2007-02-02]
energyRelevant <- energy[energy$Date >= "2007-02-01" & energy$Date <= "2007-02-02",]

attach(energyRelevant)

# Plot 1 - "Global Active Power"
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

#Saving the png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

detach(energyRelevant)
