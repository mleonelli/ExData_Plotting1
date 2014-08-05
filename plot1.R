plot1 = function(){
  
  ## load library
  if(require("sqldf") == 0){
    install.packages("sqldf")
  }
  library(sqldf)
  
  ## make a path and file string
  fn<-"ExData_Plotting1/household_power_consumption.txt"
  
  ## read file and select rows based on string "1/1/2007" and store in dataframe DF
  data <- read.csv.sql(fn, header = TRUE, sep = ";", sql = 'select * from file where (Date = "1/2/2007" OR Date = "2/2/2007")')
  
  ## Open PDF device; create 'myplot.pdf' in my working directory
  png(file = "ExData_Plotting1/figure/plot1.png", width = 480, height = 480) 
  ## Create plot and send to a file (no plot appears on screen)
   
  par(bg = "transparent")
  hist(data$Global_active_power, 
       xlab = "Global Active Power (kilowatts)", 
       col = "red", 
       main="Global Active Power", 
       axes = FALSE,
       xlim = c(0,8),
       ylim = c(0,1300))
  axis(side=1, at=seq(0, 6, by=2))
  axis(side=2, at=seq(0, 1200, by=200))
  ## Close the PDF file device
  dev.off()
  
  # close an old connection if it exists
  if (!is.null(getOption("sqldf.connection"))) sqldf()
}