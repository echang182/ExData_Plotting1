# Eloy Chang
# plot 3

# Read the file
dat<- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# change class of date and time variables
dat$Date<- as.Date(dat$Date, "%d/%m/%Y")
dat$Time<- strptime(dat$Time, format = "%H:%M:%S")

# subset the data
dat<- dat[((dat$Date=="2007-02-01")|(dat$Date=="2007-02-02")),]

# Generate plot 4
par(mfrow = c(2,2))

wd<- as.factor(weekdays(dat$Date[!is.na(dat$Global_active_power)]))  
gap<- dat$Global_active_power[!is.na(dat$Global_active_power)]
plot(gap, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

Voltage<- dat$Voltage[!is.na(dat$Voltage)]
plot(Voltage, type = "l", xlab = "datetime")

Sub_metering_1<- dat$Sub_metering_1[!is.na(dat$Sub_metering_1)]
Sub_metering_2<- dat$Sub_metering_2[!is.na(dat$Sub_metering_2)]
Sub_metering_3<- dat$Sub_metering_3[!is.na(dat$Sub_metering_3)]
plot(Sub_metering_1, type = "n", ylab = "Energy Sub Metering")
lines(Sub_metering_1, col = "black")
lines(Sub_metering_2, col = "red")
lines(Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = "")

Global_reactive_power<- dat$Global_reactive_power[!is.na(dat$Global_reactive_power)]
plot(Global_reactive_power, type = "l", xlab = "datetime")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()