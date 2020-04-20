## Reading the txt file and changing NAs
table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                    na.strings = "?")

## Subsetting the table for desired dates
data <- table[table$Date %in% c("1/2/2007", "2/2/2007"), ]

## Converting the date and time columns to one column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(data$Date, data$Time, sep = " ")
data$datetime <- as.POSIXct(datetime, format = "%Y-%m-%d %H:%M:%S")

## Opening the device and plotting
png("plot3.png", width = 480, height = 480)
with(data,
  plot(Sub_metering_1 ~ datetime, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = ""))
  lines(data$Sub_metering_2 ~ data$datetime, col = "red")
  lines(data$Sub_metering_3 ~ data$datetime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()