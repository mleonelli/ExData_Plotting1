plot4 = function(){
  
  ## load library
  if(require("sqldf") == 0){
    install.packages("sqldf")
  }
  library(sqldf)
  
  ## make a path and file string
  fn<-"ExData_Plotting1/household_power_consumption.txt"
  
  ## read file and select rows based on string "1/1/2007" and store in dataframe DF
  data <- read.csv.sql(fn, header = TRUE, sep = ";", sql = 'select * from file where (Date = "1/2/2007" OR Date = "2/2/2007")')
  data = cbind(data, strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))
  names(data)[10] <- "DateTime"
  ## Open PDF device; create 'myplot.pdf' in my working directory
  png(file = "ExData_Plotting1/figure/plot4.png", width = 480, height = 480) 
  ## Create plot and send to a file (no plot appears on screen)
  
  par(mfrow = c(2,2))
  
  with(data, {
  ##plot2
    plot(data$DateTime, data$Global_active_power,
         type="l", 
         ylab = "Global Active Power (kilowatts)",
         xlab = "")
    
    axis(side=2, at=seq(0, 6, by=2))
  
  ##plot2(Voltage)
  plot(data$DateTime, data$Voltage,
       type="l", 
       ylab = "Voltage",
       xlab = "")
  
  ##plot3
  plot(data$DateTime, data$Sub_metering_1, ylab = "Energy Sub Metering", col="black", type="l", xlab = "")
  lines(data$DateTime, data$Sub_metering_2, col="red", type="l")
  lines(data$DateTime, data$Sub_metering_3, col="blue", type="l")
  legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  
  ##plot2(REact)
  plot(data$DateTime, data$Global_reactive_power,
       type="l", 
       ylab = "Global_reactive_power",
       xlab = "")
  })
  
  dev.off()
 
}