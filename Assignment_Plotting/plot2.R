setwd("C:/Users/abaokar/DataScience/Exploratory Data Analysis/Week 1/Data/")

data <- rio::import("household_power_consumption.txt")

data$Date <- dmy(data$Date)
data$Global_active_power <- as.numeric(data$Global_active_power)

# dates <- c("2007-02-01", "2007-02-02")
sel <- data %>% filter(Date == "2007-02-02" | Date == "2007-02-01")

with(sel, plot(Global_active_power , type = "n",xaxt = "n", xlab = "", ylab= "Global Active Power (Kilowatts)") )

lines(sel$Global_active_power)
axis(1, at = c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file = "plot2.png")
dev.off()

