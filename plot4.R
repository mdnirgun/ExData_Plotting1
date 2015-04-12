## Program:     plot4.R
## Description: sources the readData() helper function for reading data file and 
##              calls it to get the required input data. It opens a PNG device
##              file, creates a 2x2 array of four graphs to be drawn. It then plots 
##              the four graphs in their respective positions. 
##              
source("readData.R")                                 ## source the helper function

power <- readData("household_power_consumption.txt")  ## read the data file

png(file = "plot4.png", width = 480, height = 480, units = "px")  ## open PNG device
par(mfrow=c(2,2))
with(power, plot(Time, Global_active_power, 
                 type = 'l', 
                 xlab = "", 
                 ylab = "Global Active Power"))
with(power, plot(Time, Voltage, 
                 type = 'l', 
                 xlab = "datetime", 
                 ylab = "Voltage"))
with(power, plot(Time, Sub_metering_1, 
                 type = 'l', 
                 xlab = "", 
                 ylab = "Energy sub metering", 
                 col="black"))
with(power, lines(Time, Sub_metering_2, 
                  type = 'l', 
                  col = "red"))
with(power, lines(Time, Sub_metering_3, 
                  type = 'l', 
                  col = "blue"))
legend("topright", pch = "__", col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(power, plot(Time, Global_reactive_power, 
                 type = 'l', 
                 xlab = "datetime"))

dev.off()