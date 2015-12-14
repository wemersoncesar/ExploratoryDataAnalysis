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

## Generating Plot 2
plot(housepowersubdata$Global_active_power ~ housepowersubdata$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")