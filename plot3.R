##I am awful at writing code but it works!

hpc <- read.csv(file = "household_power_consumption.txt", sep = ";")
hpc1$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc2 <- subset(hpc1,Date >= "2007-02-01" & Date <= "2007-02-02")
hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))
hpc2$Sub_metering_1 <- as.numeric(as.character(hpc2$Sub_metering_1))
hpc2$Sub_metering_2 <- as.numeric(as.character(hpc2$Sub_metering_2))
hpc2$Sub_metering_3 <- as.numeric(as.character(hpc2$Sub_metering_3))

hpc2$datetime <- strptime(paste(hpc2$Date, as.character.Date(hpc2$Time) ), format = "%Y-%m-%d %H:%M:%S")

plot(hpc2$datetime,hpc2$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(hpc2$datetime,hpc2$Sub_metering_1)

points(hpc2$datetime,hpc2$Sub_metering_2, type = "n")
lines(hpc2$datetime,hpc2$Sub_metering_2, col = "red")

points(hpc2$datetime,hpc2$Sub_metering_3, type = "n")
lines(hpc2$datetime,hpc2$Sub_metering_3, col = "blue")

legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.print(device = png,file = "plot3.png", height = 480, width = 480)
