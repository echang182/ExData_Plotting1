# Eloy Chang
# plot 2

# Read the file
dat<- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# change class of date and time variables
dat$Date<- as.Date(dat$Date, "%d/%m/%Y")
dat$Time<- strptime(dat$Time, format = "%H:%M:%S")

# subset the data
dat<- dat[((dat$Date=="2007-02-01")|(dat$Date=="2007-02-02")),]

# Generate plot2
wd<- as.factor(weekdays(dat$Date[!is.na(dat$Global_active_power)]))  
gap<- dat$Global_active_power[!is.na(dat$Global_active_power)]
plot(gap, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
