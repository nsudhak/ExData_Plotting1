# Plot2 Program
# fn is the file name
# dat is the subset of data filtered for the 2 dates

library(sqldf)
fn <- "household_power_consumption.txt"
dat <- read.csv.sql(fn, sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')", header = TRUE, sep = ";", eol ="\n")

datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(dat$Sub_metering_1)
subMetering2 <- as.numeric(dat$Sub_metering_2)
subMetering3 <- as.numeric(dat$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
