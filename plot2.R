##I am awful at writing code but it works!

hpc <- read.csv(file = "household_power_consumption.txt", sep = ";")
hpc1$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc2 <- subset(hpc1,Date >= "2007-02-01" & Date <= "2007-02-02")
hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))

hpc2$datetime <- strptime(paste(hpc2$Date, as.character.Date(hpc2$Time) ), format = "%Y-%m-%d %H:%M:%S")

plot(hpc2$datetime,hpc2$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(hpc2$datetime,hpc2$Global_active_power)

dev.print(device = png,file = "plot2.png", height = 480, width = 480)
