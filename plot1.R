# Assuming household_power_consumption.txt data file in working directory

# Loading data into dataframe 
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

# Subsetting the data according to the two day timespan given in the assignment instructions
subSetData <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

# Creating a new dataset from the subset given in the instructions
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Check if directory exist and if not then create it, this is for easier git handling with fork
if("ExData_Plotting1"%in%dir()==FALSE) dir.create("ExData_Plotting1")

# Opening the png graphics device with the dimensions given in the assignment instructions
png("ExData_Plotting1/plot1.png", width=480, height=480)

# Plotting the histogram with the parameters given in the assignment instructions
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Closing the graphics device
dev.off()