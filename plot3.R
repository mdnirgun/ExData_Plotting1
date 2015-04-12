## Program:     plot3.R
## Description: sources the readData() helper function for reading data file and 
##              calls it to get the required input data. It opens a PNG device
##              file and plots a line graph of the three energy sub-metering 
##              variables and then add a legend to the graph
##              
source("readData.R")                              ## source the helper function

power <- readData("household_power_consumption.txt")      ## read data file

png(file = "plot3.png", width = 480, height = 480, units = "px")  ## open PNG device

with(power, plot(Time, Sub_metering_1,            ## plot first variable
                 type='l', 
                 xlab="", 
                 ylab="Energy sub metering", 
                 col="black"))
with(power, lines(Time, Sub_metering_2,           ## add the next variable graph
                  type='l', 
                  col="red"))
with(power, lines(Time, Sub_metering_3,           ## add the third variable
                  type='l', 
                  col="blue"))
legend("topright", pch="__", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()