# Reading Data
housedt <- read.table("household_power_consumption.txt", header=T, sep=";")
 
housedt$Date <- as.Date(housedt$Date, format="%d/%m/%Y")
df <- housedt[(housedt$Date=="2007-02-01") | (housedt$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

# Generating Plot
hist(df$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")