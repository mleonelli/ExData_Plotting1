plot3 = function(){
  
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
  png(file = "ExData_Plotting1/figure/plot3.png", width = 480, height = 480) 
  ## Create plot and send to a file (no plot appears on screen)
   
 
  plot(data$DateTime, data$Sub_metering_1, ylab = "Energy Sub Metering", col="black", type="l", xlab = "")
  lines(data$DateTime, data$Sub_metering_2, col="red", type="l")
  lines(data$DateTime, data$Sub_metering_3, col="blue", type="l")
  legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
}