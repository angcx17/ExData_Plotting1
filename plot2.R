## Reading the txt file and changing NAs
table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                    na.strings = "?")

## Subsetting the table for desired dates
data <- table[table$Date %in% c("1/2/2007", "2/2/2007"), ]

## Converting the date and time columns to one column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(data$Date, data$Time, sep = " ")
data$datetime <- as.POSIXct(datetime, format = "%Y-%m-%d %H:%M:%S")

## Plotting the chart into a png
png("plot2.png", width = 480, height = 480)
with(data, 
     plot(Global_active_power ~ datetime, type = "l",
          ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()

