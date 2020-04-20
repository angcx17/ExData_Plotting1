## Reading the txt file and changing NAs
table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                    na.strings = "?")

## Subsetting the table for desired dates
data <- table[table$Date %in% c("1/2/2007", "2/2/2007"), ]

## Converting the date column to date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Open the device, plotting the histogram, and closing the device
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts", ylab = "Frequency", col = "red")
dev.off()