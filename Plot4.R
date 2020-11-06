# Plot4 Program
# fn is the file name
# dat is the subset of data filtered for the 2 dates

library(sqldf)
fn <- "household_power_consumption.txt"
dat <- read.csv.sql(fn, sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')", header = TRUE, sep = ";", eol ="\n")

datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivepower <- as.numeric(dat$Global_active_power)
globalReactivepower <- as.numeric(dat$Global_reactive_power)
voltage <- as.numeric(dat$Voltage)
subMetering1 <- as.numeric(dat$Sub_metering_1)
subMetering2 <- as.numeric(dat$Sub_metering_2)
subMetering3 <- as.numeric(dat$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalActivepower,type ="l", xlab="", ylab="Global Active Power", cex = 0.2)
plot(datetime, voltage,type ="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivepower,type ="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()