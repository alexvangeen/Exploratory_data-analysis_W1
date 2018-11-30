df <- read.table("household_power_consumption.txt", header = TRUE, sep=';', stringsAsFactors=FALSE, na.strings="?")
#converting the Date and Time variables to Date/Time classes
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#plot 2 graph with on x thu, fri, sat global active power (y)
df$datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")
df$datetimect = as.POSIXct(df$datetime)
png(filename="plot2.png",width=480,height=480)
plot(df$datetimect, df$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()