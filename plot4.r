#Load-up data and create a dataframe

housepower <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
housepower$Date <- as.Date(housepower$Date, format="%d/%m/%Y")
febdata <- subset(housepower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(housepower)
datetime <- paste(as.Date(febdata$Date), febdata$Time)
febdata$Datetime <- as.POSIXct(datetime)

#Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1))
plot(febdata$Global_active_power~febdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(febdata$Voltage~febdata$Datetime, type="l", ylab="Voltage", xlab="datetime")
plot(febdata$Datetime, febdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(febdata$Datetime, febdata$Sub_metering_2, col="red")
lines(febdata$Datetime, febdata$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(febdata$Global_reactive_power~febdata$Datetime, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, file ="Plot4.png", height = 480, width = 480)
dev.off()
