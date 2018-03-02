# Assuming that the household_power_consumption.txt data file is in the working directory

# Loading data into dataframe 
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

# Subsetting the data according to the two day timespan given in the assignment instructions
subSetData <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

# Creating a new dataset from the subset given in the instructions
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Checking if directory exist and if not then create it, this is for easier git handling with fork
# if("ExData_Plotting1"%in%dir()==FALSE) dir.create("ExData_Plotting1")

# Opening the png graphics device with the dimensions given in the assignment instructions
png("plot1.png", width=480, height=480)

# Alternative to plot to forked and cloned directory
# png("ExData_Plotting1/plot1.png", width=480, height=480)

# Plotting the histogram with the parameters given in the assignment instructions
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Using copying instead to plot to file; 
# either using the folder ExData_Plotting1 as destination or plotting directly the to working directory
# dev.copy(png, file="ExData_Plotting1/plot1.png", height=480, width=480)
# dev.copy(png, file="plot1.png", height=480, width=480)

# Closing the graphics device
dev.off()

