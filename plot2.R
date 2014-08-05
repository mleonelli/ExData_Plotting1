plot2 = function(){
  
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
  png(file = "ExData_Plotting1/figure/plot2.png", width = 480, height = 480) 
  ## Create plot and send to a file (no plot appears on screen)
   
  
  plot(data$DateTime, data$Global_active_power,
       type="l", 
       ylab = "Global Active Power (kilowatts)",
       xlab = "")
  
  axis(side=2, at=seq(0, 6, by=2))
  
  
  ## Close the PDF file device
  dev.off()
  
  # close an old connection if it exists
  if (!is.null(getOption("sqldf.connection"))) sqldf()
}