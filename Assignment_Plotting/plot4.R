setwd("C:/Users/abaokar/DataScience/Exploratory Data Analysis/Week 1/Data/")

data <- rio::import("household_power_consumption.txt")

data$Date <- dmy(data$Date)
data$Global_active_power <- as.numeric(data$Global_active_power)

# dates <- c("2007-02-01", "2007-02-02")
sel <- data %>% filter(Date == "2007-02-02" | Date == "2007-02-01")

# windows(height = 7, width = 8)


png(filename = "plot4.png")
par(mfrow = c(2,2))


plot(sel$Global_active_power , type = "n",xaxt = "n", xlab = "", ylab= "Global Active Power")
lines(sel$Global_active_power)
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))

plot(sel$Voltage , type = "n",xaxt = "n", xlab = "datetime", ylab= "Voltage")
lines(sel$Voltage)
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))

plot(sel$Sub_metering_1 , type = "n",xaxt = "n", xlab = "", ylab= "Energy Sub Metering")

lines(sel$Sub_metering_1)
lines(sel$Sub_metering_2, col = "red")
lines(sel$Sub_metering_3, col = "blue")
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))
legend("topright",lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(sel$Global_reactive_power , type = "n",xaxt = "n", xlab = "datetime", ylab= "Global_reactive_power")
lines(sel$Global_reactive_power)
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))

# dev.cur()
# dev.copy(png, file = "plot4.png")
dev.off()

