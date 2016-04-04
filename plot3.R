# Eloy Chang
# plot 3

# Read the file
dat<- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# change class of date and time variables
dat$Date<- as.Date(dat$Date, "%d/%m/%Y")
dat$Time<- strptime(dat$Time, format = "%H:%M:%S")

# subset the data
dat<- dat[((dat$Date=="2007-02-01")|(dat$Date=="2007-02-02")),]

# Generate plot 3
wd<- as.factor(weekdays(dat$Date[!is.na(dat$Global_active_power)]))  
Sub_metering_1<- dat$Sub_metering_1[!is.na(dat$Sub_metering_1)]
Sub_metering_2<- dat$Sub_metering_2[!is.na(dat$Sub_metering_2)]
Sub_metering_3<- dat$Sub_metering_3[!is.na(dat$Sub_metering_3)]
plot(Sub_metering_1, type = "n", ylab = "Energy Sub Metering")
lines(Sub_metering_1, col = "black")
lines(Sub_metering_2, col = "red")
lines(Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), text.col = c("black", "red", "blue"), lty = 1)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
