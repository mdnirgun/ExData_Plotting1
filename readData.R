## Function:    readData(file)
## Arguments:   file to read from
## Output:      Data frame containing a subset of data in input file
## Description: This function reads the power consumption data from the filename
##              passed and cleans the raw data to return a subset of the data frame.
##              The Date and Time variables are converted to Date and POSIXlt types.
##              The complete data is subsetted to select the observations for only
##              the dates required i.e. 2007-02-01 and 2007-02-02. This smaller
##              data frame is returned back and the original raw data object is
##              removed from memory.
readData <- function(file) {
  fulldata <- read.table(file, na.strings="?", sep=";", header=TRUE)  ## read from file
  fulldata$Time <- strptime(paste(fulldata$Date, fulldata$Time),   ## convert to POSIXlt
                            format="%d/%m/%Y %H:%M:%S")
  fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")    ## convert to Date
  subdata <- fulldata[fulldata$Date == as.Date('2007-02-01') | 
                      fulldata$Date == as.Date('2007-02-02'), ]  ## subsetting
  rm(fulldata)   ## get rid of the large object
  
  return(subdata)
}
