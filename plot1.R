##I am awful at writing code but it works!

hpc <- read.csv(file = "household_power_consumption.txt", sep = ";")
hpc1$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc2 <- subset(hpc1,Date >= "2007-02-01" & Date <= "2007-02-02")
hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))
hist(hpc2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.print(device = png,file = "plot1.png", height = 480, width = 480)
