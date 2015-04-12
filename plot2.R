## Program:     plot2.R
## Description: sources the readData() helper function for reading data file and 
##              calls it to get the required input data. It opens a PNG device
##              file and plots a line graph of the Global Active Power.
##              Assumption: The data file is available in the current directory.
##
source("readData.R")                          ## source the helper function

power <- readData("household_power_consumption.txt")     ## read the data file

png(file = "plot2.png", width = 480, height = 480, units = "px")  ## open PNG device

with(power, plot(Time, Global_active_power, 
                 type='l',                               ## graph type is l
                 xlab="",                                ## No X axis label
                 ylab="Global Active Power(kilowatts)")) ## set Y axis label

dev.off()                                                ## close the PNG device
