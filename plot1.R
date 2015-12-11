## Creates a png file of a histogram showing the household global minute-averaged
## active power between February 01, 2007 and February 02, 2007

plot1 <- function(data=NULL) {
        
        ## Reading the data
        data <- read.table("household_power_consumption.txt", 
                           na.strings = "?", 
                           header = TRUE, 
                           sep = ";")
        
        ## Subsetting the data 
        data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
        
        ## Opening png device
        png("plot1.png")
        
        ## Creating histogram
        hist(data$Global_active_power,
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)",
             ylab="Frequency",
             col="red")
        
        ## Turning off device
        dev.off()
}