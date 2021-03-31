getwd()

data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric", "numeric")) %>% 
    mutate(Date = as.Date(Date, format = "%d/%m/%Y"),
           datetime = strptime(paste(Date, Time, sep = " "), format = "%Y-%m-%d %H:%M:%S"))

filtered <- data %>% 
    filter(Date == "2007-02-01" | Date == "2007-02-02") 
data <- data[,!(names(data) %in% c("Date", "Time"))]


    plot(filtered$datetime, filtered$Global_active_power, type = "l", ylab = "Global Active Power",
         xlab = "datetime")
     

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()









data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric", "numeric")) %>% 
    mutate(Date = as.Date(Date, format = "%d/%m/%Y"),
           datetime = strptime(paste(Date, Time, sep = " "), format = "%d/-%m-%y"))

filtered <- data %>% 
    filter(Date == "2007-02-01" | Date == "2007-02-02") 

data <- data[,!(names(data) %in% c("Date", "Time"))]
data$datetime <- as.POSIXct(datetime) 
 





