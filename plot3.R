## Creates a png file of a line graph showing the energy sub-metering no. 1, no.2,
## and no.3 between February 01, 2007 and February 02, 2007

plot3 <- function(data=NULL) {
        
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
        png("plot3.png")
        
        ## Plotting line graph with legend
        with(data, {
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
                       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                       lty= 1)}
        )
        
        ## Turning off device
        dev.off()
}