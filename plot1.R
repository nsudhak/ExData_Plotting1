# Plot1 Program
# fn is the file name
# dat is the subset of data filtered for the 2 dates

library(sqldf)
fn <- "household_power_consumption.txt"
dat <- read.csv.sql(fn, sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')", header = TRUE, sep = ";", eol ="\n")

png("plot1.png", width=480, height=480)
hist(dat$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()

