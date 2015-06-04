base_data <- read.table("./household_power_consumption.txt", header=TRUE, 
                        sep = ";", quote = '\"', na.strings = "?")
base_data$Date <- as.Date(base_data$Date, format ="%d/%m/%Y")
base_data$Time <- as.POSIXct(paste(base_data$Date, base_data$Time), 
                             format="%Y-%m-%d %H:%M:%S")

plot4_subset  <- subset(base_data, subset=(Date >= "2007-02-01" & 
                                                   Date <= "2007-02-02"))


png("plot4.png", height=480, width=480)

par(mfrow = c(2,2))
#plot 1
plot(plot4_subset$Time, plot4_subset$Global_active_power, type = "l",  
     xlab = "", ylab = "Global Active Power")
#plot 2
plot(plot4_subset$Time, plot4_subset$Voltage, type = "l",  
     xlab = "datetime", ylab = "Voltage")
#plot 3
plot(plot4_subset$Time, plot4_subset$Sub_metering_1, type = "l",  
     xlab = "", ylab = "Energy sub metering")
lines(plot4_subset$Time, plot4_subset$Sub_metering_2, col = "Red")
lines(plot4_subset$Time, plot4_subset$Sub_metering_3, col = "Blue")
legend("topright", pch = "--",  col = c("Black", "Red", "Blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
#plot 4
plot(plot4_subset$Time, plot4_subset$Global_reactive_power, type = "l",
     xlab ="datetime", ylab = "Global_reactive_power")

dev.off()
