
#load the data in R
data <- read.table("household_power_consumption.txt", na.strings ="?", sep=";", header=T)

#convert the date/time columns
data <- transform(data, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Date = as.Date(Date, "%d/%m/%Y"))[, -2]

#filter the date
data_f <- data[(data[, "Date"] >= "2007-02-01") & (data[, "Date"] <= "2007-02-02"),]

#produce the plot
png("plot1.png")
hist(data_f[, "Global_active_power"], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()