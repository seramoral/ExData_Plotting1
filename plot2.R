
#read the data

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, sep = ";", na.strings = "?", header=TRUE)

# change the date format 

date <- data$Date
date <- as.Date(data$Date, format = "%d/%m/%Y") 
data$Date <- date

#Extract de data of the date requeired

definitive_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

global_active_power <- definitive_data$Global_active_power

time <- definitive_data$Time
date_time <- strptime(paste(definitive_data$Date, time), "%Y-%m-%d %H:%M:%S")
date_time2 <- as.POSIXct(date_time)

#plot

dev.copy(png, file = "plot2.png", height = 480, width = 480)

plot(x = date_time2, y = global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()