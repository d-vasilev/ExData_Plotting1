
#load the data in R
data <- read.table("household_power_consumption.txt", na.strings ="?", sep=";", header=T)

#convert the date/time columns
data <- transform(data, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Date = as.Date(Date, "%d/%m/%Y"))[, -2]

#filter the date
data_f <- data[(data[, "Date"] >= "2007-02-01") & (data[, "Date"] <= "2007-02-02"),]

#produce the plots
png("plot4.png")
par(mfrow=c(2, 2))

#top left plot
plot(data_f[, "DateTime"], data_f[, "Global_active_power"], type="l", xlab="", ylab="Global Active Power")

#top rigth plot
plot(data_f[, "DateTime"], data_f[, "Voltage"], type="l", xlab="datetime", ylab="Voltage")

#bottom left plot
plot(data_f[, "DateTime"], data_f[, "Sub_metering_1"], type="l", xlab="", ylab="Energy sub metering")
lines(data_f[, "DateTime"], data_f[, "Sub_metering_2"],  col="red")
lines(data_f[, "DateTime"], data_f[, "Sub_metering_3"],  col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")

#bottom right plot
plot(data_f[, "DateTime"], data_f[, "Global_reactive_power"], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()