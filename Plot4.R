power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")
powersub <- filter(power, Date >= "2007-02-01" & Date <= "2007-02-02")
powersub$newdate <- as.POSIXct(paste(powersub$Date,powersub$Time), format="%Y-%m-%d %H:%M:%S")
options(digits=4)
par("mar" = c(4,4,2,2))
plot(powersub$newdate, as.numeric(as.character(powersub$Global_active_power)), col="black", type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(powersub$newdate, as.numeric(as.character(powersub$Global_active_power)),type="l")

plot(powersub$newdate, as.numeric(as.character(powersub$Voltage)), col="black", type="n", xlab="datetime", ylab="Voltage")
lines(powersub$newdate, as.numeric(as.character(powersub$Voltage)),type="l")

plot(powersub$newdate, as.numeric(as.character(powersub$Sub_metering_1)), type="n", xlab="", ylab="Energy sub metering")
lines(powersub$newdate, as.numeric(as.character(powersub$Sub_metering_1)), col="black", type="l")
lines(powersub$newdate, as.numeric(as.character(powersub$Sub_metering_2)), col="red", type="l")
lines(powersub$newdate, as.numeric(as.character(powersub$Sub_metering_3)), col="blue", type="l")
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(powersub$newdate, as.numeric(as.character(powersub$Global_reactive_power)), col="black", type="n", xlab="datetime", ylab="Global_reactive_power")
lines(powersub$newdate, as.numeric(as.character(powersub$Global_reactive_power)),type="l")

dev.copy(png, file = "Plot4.png")
dev.off()
