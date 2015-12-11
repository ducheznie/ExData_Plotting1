## Creates a png file of 4 line graphs showing different energy usage
## between February 01, 2007 and February 02, 2007

plot4 <- function(data=NULL) {
        
        ## Reading the data
        data <- read.table("household_power_consumption.txt", 
                           na.strings = "?", 
                           header = TRUE, 
                           sep = ";")
        
        ## Subsetting the data 
        data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
        
        ## Adding a column that includes both date and time
        data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                                  format="%d/%m/%Y %H:%M:%S")
        
        ## Opening png device
        png("plot4.png")
        
        ## Setting up area for 4 graphs
        par(mfrow = c(2, 2))
        
        with(data, {
                ## Graph 1   
                plot(DateTime, 
                     Global_active_power, 
                     type="l", 
                     xlab= "",
                     ylab="Global Active Power")
                
                ## Graph 2
                plot(DateTime,
                  Voltage,
                  type= "l",
                  xlab= "datetime",
                  ylab= "Voltage")
                
                ## Graph 3
                plot(DateTime, 
                     Sub_metering_1, 
                     type="l", 
                     xlab= "",
                     ylab="Energy sub metering",
                     col= "black")
                lines(DateTime, 
                      Sub_metering_2,
                      col= "red")
                lines(DateTime, 
                      Sub_metering_3,
                      col= "blue")
                legend("topright",
                       col= c("black", "red", "blue"),
                       c("Sub_metering_1", 
                         "Sub_metering_2", 
                         "Sub_metering_3"),
                       lty= 1,
                       bty= "n")
                
                ## Graph 4
                plot(DateTime,
                     Global_reactive_power,
                     type= "l",
                     xlab= "datetime",
                     ylab= "Global_reactive_power")
                })
        
        ## Turning off device
        dev.off()
}