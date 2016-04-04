# Eloy Chang
# plot 1

# Read the file
dat<- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# change class of date and time variables
dat$Date<- as.Date(dat$Date, "%d/%m/%Y")
dat$Time<- strptime(dat$Time, format = "%H:%M:%S")

# subset the data
dat<- dat[((dat$Date=="2007-02-01")|(dat$Date=="2007-02-02")),]

# Generate plot1
hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     xlim = c(0,6), main = "Global Active Power" )
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
