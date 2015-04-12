## Function:    readData(file)
## Arguments:   file to read from
## Output:      Data frame containing a subset of data in input file
## Description: This function reads the power consumption data from the filename
##              passed using the fread() function from data.table package for 
##              efficiency. The reading skips to the first record with date as 
##              '1/2/2007' and reads two days worth of rows from the data file.
##              As the skipping also causes the header row to be ignored, we have 
##              to read in the header row separately to get the variable names.
##              Although this causes two reads on the file, the overall speed of 
##              getting the data remains faster than the alternative, and 
##              subsequent subsetting is avoided.
##              The Date and Time variables are converted to Date and POSIXct types.
##              Note: using strptime() returns a POSIXlt type which is a list and
##              gives error when assigning in a data frame. Therefore it is safer
##              to cast it as  POSIXct type.
library(data.table)

readData <- function(file) {
  namerow <- fread(file, nrows = 1, header = FALSE)      ## read header row
  df <- fread(file, na.strings="?", sep=";", skip="1/2/2007", nrows=2880)   ## read required data
  setnames(df, as.character(head(namerow)))              ## set the variable names
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")         ## convert to Date type
  df$Time <- as.POSIXct(strptime(paste(as.character(df$Date), df$Time, sep=" "), 
                                 format="%Y-%m-%d %H:%M:%S"))  ## convert Time to POSIXct

  return(df)
}
