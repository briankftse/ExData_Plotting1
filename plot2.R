# plot2.R

# Read in the data
data <- read.table("household_power_consumption.txt", sep = ";", 
                   header = TRUE, stringsAsFactors = FALSE)

# Subset the data for 1/2/2007 and 2/2/2007 only
d <- data[(data$Date == '1/2/2007') | (data$Date == '2/2/2007'),]

# Create a vector containing the R object of date/time
datetime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

# Create png file plot2.png with 480x480 dimensions
png("plot2.png", 480,480)

# Create the plot
plot(datetime, d$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Save the plot to the png
dev.off()



