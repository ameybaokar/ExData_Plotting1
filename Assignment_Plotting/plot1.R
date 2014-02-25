setwd("C:/Users/abaokar/DataScience/Exploratory Data Analysis/Week 1/Data/")

data <- rio::import("household_power_consumption.txt")

data$Date <- dmy(data$Date)
data$Global_active_power <- as.numeric(data$Global_active_power)
# dates <- c("2007-02-01", "2007-02-02")
sel <- data %>% filter(Date == "2007-02-02" | Date == "2007-02-01")

hist(sel$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)",
     main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()

