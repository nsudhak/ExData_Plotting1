# Plot2 Program
# fn is the file name
# dat is the subset of data filtered for the 2 dates

library(sqldf)
fn <- "household_power_consumption.txt"
dat <- read.csv.sql(fn, sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')", header = TRUE, sep = ";", eol ="\n")

datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivepower <- as.numeric(dat$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalActivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
