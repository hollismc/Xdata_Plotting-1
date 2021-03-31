
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric", "numeric")) %>% 
    mutate(Date = as.Date(Date, format = "%d/%m/%Y"),
           datetime = strptime(paste(Date, Time, sep = " "), format = "%Y-%m-%d %H:%M:%S"))

filtered <- data %>% 
    filter(Date == "2007-02-01" | Date == "2007-02-02") 
data <- data[,!(names(data) %in% c("Date", "Time"))]


    plot(filtered$datetime,filtered$Sub_metering_1, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(filtered$datetime,filtered$Sub_metering_2,col='Red')
    lines(filtered$datetime,filtered$Sub_metering_3,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()