# first we read the data:
# note that the seperator is a semi colon:
# note: we assume that we have the source dataset in the same folder:

data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header = TRUE)

# convert the data colum:
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# select only the range of dates we are interested in:
date.range <- as.Date(c("2007-02-01","2007-02-02"))

subdata <- data[data$Date==date.range[1] | data$Date==date.range[2],]

# Draw the first plot:
png(file="plot1.png")
hist(subdata$Global_active_power, col = 'red', main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
