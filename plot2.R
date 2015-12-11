## Creates a png file of a line graph showing the household global minute-averaged
## active power between February 01, 2007 and February 02, 2007

plot2 <- function(data=NULL) {
        
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
        png("plot2.png")
        
        ## Plotting the line graph
        with(data, 
             plot(DateTime, 
                  Global_active_power, 
                  type="l", 
                  xlab= "",
                  ylab="Global Active Power (kilowatts)"))
        
        ## Turning off device
        dev.off()
}