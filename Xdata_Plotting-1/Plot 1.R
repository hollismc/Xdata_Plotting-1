# read info into R
getwd()






library(tidyr)
library(tidyverse)
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric", "numeric")) %>% 
    mutate(Date = as.Date(Date, format = "%d/%m/%Y"),
        datetime = strptime(paste(Date, Time, sep = " "), format = "%Y-%m-%d %H:%M:%S"))

filtered <- data %>% 
    filter(Date == "2007-02-01" | Date == "2007-02-02") 
data <- data[,!(names(data) %in% c("Date", "Time"))]



hist(filtered$Global_active_power, main = "Global Active Power", 
     xlab = "Global ActivePower(kilowatts)", col = "red")
#save files
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()

    
    
    

