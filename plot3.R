# Assuming that the household_power_consumption.txt data file is in the working directory

# Loading data into dataframe 
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

# Subsetting the data according to the two day timespan given in the assignment instructions
subSetData <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

# Using str as adviced in instructions on the subset data to get the data and time
dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Creating a new dataset from the subset given in the instructions
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Checking if directory exist and if not then create it, this is for easier git handling with fork
# if("ExData_Plotting1"%in%dir()==FALSE) dir.create("ExData_Plotting1")

# Opening the png graphics device with the dimensions given in the assignment instructions
png("plot3.png", width=480, height=480)

# Alternative to plot to forked and cloned directory
# png("ExData_Plotting1/plot3.png", width=480, height=480)

# Plotting with the parameters given in the assignment instructions
plot(dateTime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Using copying instead to plot to file; 
# either using the folder ExData_Plotting1 as destination or plotting directly the to working directory
# dev.copy(png, file="ExData_Plotting1/plot3.png", height=480, width=480)
# dev.copy(png, file="plot3.png", height=480, width=480)

# Closing the graphics device
dev.off()








