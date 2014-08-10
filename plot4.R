# plot4.R

# Read in the data
data <- read.table("household_power_consumption.txt", sep = ";", 
                   header = TRUE, stringsAsFactors = FALSE)

# Subset the data for 1/2/2007 and 2/2/2007 only
d <- data[(data$Date == '1/2/2007') | (data$Date == '2/2/2007'),]

# Create a vector containing the R object of date/time
datetime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

# Create png file plot4.png with 480x480 dimensions
png("plot4.png", 480,480)

# create 2x2 matrix for plots
par(mfrow=c(2,2))

# Draw first plot
plot(datetime, d$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# Draw second plot
plot(datetime, d$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")


# Draw third plot
plot(datetime, d$Sub_metering_1, type="l", 
     ylab = "Energy sub metering", xlab = "")

# Add submetring 2 plot
lines(datetime, d$Sub_metering_2, type = "l", col = "red")

# Add submetring 3 plot
lines(datetime, d$Sub_metering_3, type = "l", col = "blue")

# Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 1, bty = "n", col = c("black", "red", "blue"))

# Draw fourth plot
plot(datetime, d$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# Save the plot to the png
dev.off()