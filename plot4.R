# first we read the data:
# note that the seperator is a semi colon:
# note: we assume that we have the source dataset in the same folder:

data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header = TRUE)

# convert the data colum:
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# select only the range of dates we are interested in:
date.range <- as.Date(c("2007-02-01","2007-02-02"))

subdata <- data[data$Date==date.range[1] | data$Date==date.range[2],]

# Draw the second plot:
# for the x axis we use the current time value, so we need to convert the time column:
#times <- strptime(subdata$Time)
# offset by the initial value, and jsut count the minutes:
#times <- (as.numeric(times - times[1]))/60

datetimes <- as.POSIXct(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot4.png")

# multi plot display:
par(mfrow = c(2,2), mar = c(4,4,1,1))
# plot 1
plot(subdata$Global_active_power ~ datetimes, type='l', ylab = "Global Active Power", xlab="")

# plot 2
plot(subdata$Voltage ~ datetimes, type='l', ylab = "Voltage", xlab="datetime")

# plot 3
plot(subdata$Sub_metering_1 ~ datetimes, type='l', ylab = "Energy Sub Metering", xlab="")
lines(datetimes, subdata$Sub_metering_2, col='red')
lines(datetimes, subdata$Sub_metering_3, col='blue')
legend("topright", pch = '-', col = c("black", "red", "blue"), legend=c("Sub_metering_1","SUb_metering_2","SUb_metering_3"))

# plot 4
plot(subdata$Global_reactive_power ~ datetimes, type='l', ylab = "Global_reactive_power", xlab="datetime")

dev.off()
