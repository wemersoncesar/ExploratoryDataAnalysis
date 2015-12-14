housepower<- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
housepower$Date <- as.Date(housepower$Date, format = "%d/%m/%Y")

## Subsetting the data
housepowersubdata <- subset(housepower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(housepower)

## Converting dates
datetime <- paste(as.Date(housepowersubdata$Date), housepowersubdata$Time)
housepowersubdata$Datetime <- as.POSIXct(datetime)


with(housepowersubdata, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))