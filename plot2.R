base_data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", quote = '\"', na.strings = "?")
base_data$Date <- as.Date(base_data$Date, format ="%d/%m/%Y")
base_data$Time <- as.POSIXct(paste(base_data$Date, base_data$Time), format="%Y-%m-%d %H:%M:%S")

#Subset Data
plot2_subset  <- subset(base_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Plot Graphs and annotate where necessary
plot(plot2_subset$Time, plot2_subset$Global_active_power, type = "l",  
     xlab = "", ylab = "Global Active Power (kilowatts)")
#copy files
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()