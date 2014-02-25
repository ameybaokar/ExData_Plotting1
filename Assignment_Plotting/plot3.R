setwd("C:/Users/abaokar/DataScience/Exploratory Data Analysis/Week 1/Data/")

data <- rio::import("household_power_consumption.txt")

data$Date <- dmy(data$Date)
data$Global_active_power <- as.numeric(data$Global_active_power)

# dates <- c("2007-02-01", "2007-02-02")
sel <- data %>% filter(Date == "2007-02-02" | Date == "2007-02-01")

png(filename = "plot3.png")
plot(sel$Sub_metering_1 , type = "n",xaxt = "n", xlab = "", ylab= "Energy Sub Metering")

lines(sel$Sub_metering_1)
lines(sel$Sub_metering_2, col = "red")
lines(sel$Sub_metering_3, col = "blue")
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))
legend("topright",lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()

