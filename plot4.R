#plot4 - 4 plots together
df <- read.table("household_power_consumption.txt", header = TRUE, sep=';', stringsAsFactors=FALSE, na.strings="?")
#converting the Date and Time variables to Date/Time classes
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
df$datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")
df$datetimect = as.POSIXct(df$datetime)
png(filename="Plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(df, plot(datetimect, Global_active_power, type="l",
              ylab="Global Active Power", xlab=""))
with(df,plot(datetimect, Voltage, yaxt="none", type="l", 
             ylab="Voltage", xlab="datetime")) 
axis(2, seq(230,248,4))
with(df, plot(datetimect,Sub_metering_1, type="l",
              ylab="Energy sub metering", xlab=""))
lines(df$datetimect, df$Sub_metering_2, type = "l",col = "red") 
lines(df$datetimect, df$Sub_metering_3, type = "l",col = "blue") 
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), cex=0.5, bty = "n")
with(df,plot(datetimect, Global_reactive_power, type="l",
             ylab="Global_reactive_power", xlab="datetime"))
axis(2, seq(0,0.6,0.1))
dev.off()
