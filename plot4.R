##I am awful at writing code but it works!

par(mfrow = c(2,2))

#load data
hpc <- read.csv(file = "household_power_consumption.txt", sep = ";")
hpc1$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc2 <- subset(hpc1,Date >= "2007-02-01" & Date <= "2007-02-02")
hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))
hpc2$Global_reactive_power <- as.numeric(as.character(hpc2$Global_reactive_power))
hpc2$Sub_metering_1 <- as.numeric(as.character(hpc2$Sub_metering_1))
hpc2$Sub_metering_2 <- as.numeric(as.character(hpc2$Sub_metering_2))
hpc2$Sub_metering_3 <- as.numeric(as.character(hpc2$Sub_metering_3))
hpc2$datetime <- strptime(paste(hpc2$Date, as.character.Date(hpc2$Time) ), format = "%Y-%m-%d %H:%M:%S")
hpc2$Voltage <- as.numeric(as.character(hpc2$Voltage))

## Plot 1 - Upper left
plot(hpc2$datetime,hpc2$Global_active_power, type = "n", ylab = "Global Active Power", xlab = "")
lines(hpc2$datetime,hpc2$Global_active_power)

## Plot 2 - Upper Right
plot(hpc2$datetime,hpc2$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
lines(hpc2$datetime,hpc2$Voltage)


## Plot 3 - Lower left
plot(hpc2$datetime,hpc2$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(hpc2$datetime,hpc2$Sub_metering_1)

points(hpc2$datetime,hpc2$Sub_metering_2, type = "n")
lines(hpc2$datetime,hpc2$Sub_metering_2, col = "red")

points(hpc2$datetime,hpc2$Sub_metering_3, type = "n")
lines(hpc2$datetime,hpc2$Sub_metering_3, col = "blue")

legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Plot 4 - lower right
plot(hpc2$datetime,hpc2$Global_reactive_power, type = "n", ylab = "Globa_reactive_power", xlab = "datetime")
lines(hpc2$datetime,hpc2$Global_reactive_power)


dev.print(device = png,file = "plot4.png", height = 480, width = 480)