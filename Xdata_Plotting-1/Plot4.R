data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric", "numeric")) %>% 
    mutate(Date = as.Date(Date, format = "%d/%m/%Y"),
           datetime = strptime(paste(Date, Time, sep = " "), format = "%Y-%m-%d %H:%M:%S"))

filtered <- data %>% 
    filter(Date == "2007-02-01" | Date == "2007-02-02") 
data <- data[,!(names(data) %in% c("Date", "Time"))]

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

    plot(filtered$datetime, filtered$Global_active_power, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(filtered$datetime, filtered$Voltage, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(filtered$datetime, filtered$Sub_metering_1, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(filtered$datetime, filtered$Sub_metering_2,col='Red')
    lines(filtered$datetime, filtered$Sub_metering_3,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(filtered$datetime, filtered$Global_reactive_power, type="l", 
         ylab="Global Reactive Power (kilowatts)",xlab="")
    
    dev.copy(png, file="plot4.png", height=480, width=480)
    dev.off()
