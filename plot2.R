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

png(file="plot2.png")
plot(subdata$Global_active_power ~ datetimes, type='l', ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
