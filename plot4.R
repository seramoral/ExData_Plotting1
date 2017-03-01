#read the data

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, sep = ";", na.strings = "?", header=TRUE)

# change the date format 

date <- data$Date
date <- as.Date(data$Date, format = "%d/%m/%Y") 
data$Date <- date

#Extract de data of the date requeired

definitive_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

sub_metering_1 <- definitive_data$Sub_metering_1
sub_metering_2 <- definitive_data$Sub_metering_2
sub_metering_3 <- definitive_data$Sub_metering_3
global_active_power <- definitive_data$Global_active_power
global_reactive_power <- definitive_data$Global_reactive_power
voltage <- definitive_data$Voltage

time <- definitive_data$Time
date_time <- strptime(paste(definitive_data$Date, time), "%Y-%m-%d %H:%M:%S")
date_time2 <- as.POSIXct(date_time)

#plot

dev.copy(png, file = "plot4.png", height = 480, width = 480)

par(mfrow = c(2, 2))

plot(x = date_time2, y = global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(x = date_time2, y = voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(x = date_time2, y = sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = date_time2, y = sub_metering_2 ,col="red")
lines(x = date_time2, y = sub_metering_3 ,col="blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  bty = "n")


plot(x = date_time2, y = global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")



dev.off()