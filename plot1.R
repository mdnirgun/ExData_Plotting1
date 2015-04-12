## Program:     plot1.R
## Description: sources the readData.R() helper function for reading data file and 
##              calls it to get the required input data. It opens a PNG device
##              file and plots a histogram of the Global Active Power.
##              Assumption: The data file is available in the current directory.
source("readData.R")                          ## source the helper function

power <- readData("household_power_consumption.txt")   ##read input data

png(file = "plot1.png", width = 480, height = 480, units = "px")  ## open PNG device

hist(power$Global_active_power,               ## plot histogram
     xlab='Global Active Power(kilowatts)',   ## set X axis label
     main='Global Active Power',              ## set main title for the graph
     col=c("red"))                            ## set histogram color

dev.off()                                     ## close PNG device
