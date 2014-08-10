# plot1.R

# Read in the data
data <- read.table("household_power_consumption.txt", sep = ";", 
                   header = TRUE, stringsAsFactors = FALSE)

# Subset the data for 1/2/2007 and 2/2/2007 only
d <- data[(data$Date == '1/2/2007') | (data$Date == '2/2/2007'),]

# Create png file plot1.png with 480x480 dimensions
png("plot1.png", 480,480)

# Create the histogram
hist(as.numeric(d$Global_active_power), col="RED",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Save the histogram to the png file
dev.off()