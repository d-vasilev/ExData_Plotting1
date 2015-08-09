
#load the data in R
data <- read.table("household_power_consumption.txt", na.strings ="?", sep=";", header=T)

#convert the date/time columns
data <- transform(data, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Date = as.Date(Date, "%d/%m/%Y"))[, -2]

#filter the date
data_f <- data[(data[, "Date"] >= "2007-02-01") & (data[, "Date"] <= "2007-02-02"),]

#produce the plot
png("plot3.png")
plot(data_f[, "DateTime"], data_f[, "Sub_metering_1"], type="l", xlab="", ylab="Energy sub metering")
lines(data_f[, "DateTime"], data_f[, "Sub_metering_2"],  col="red")
lines(data_f[, "DateTime"], data_f[, "Sub_metering_3"],  col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()