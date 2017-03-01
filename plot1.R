
#read the data

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, sep = ";", na.strings = "?", header=TRUE)

# change the date format 

date <- data$Date
date <- as.Date(data$Date, format = "%d/%m/%Y") 
data$Date <- date

#Extract de data of the date requeired

definitive_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Extract the global active power

global_active_power <- definitive_data$Global_active_power

# plot the historgram

dev.copy(png, file = "plot1.png", height = 480, width = 480)

hist(global_active_power, xlab = "Global Active Power", ylab="Frequency", main = "Global Active Power" ,col = "Red")

dev.off()