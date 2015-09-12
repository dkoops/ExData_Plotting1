#
# load_power_consumption.R
#
# This script loads the file household_power_consumption.txt from 
# the local directory into R. The routine creates a datetime column from the 
# text date and time fields and returns a subset of the dataset that contains
# only the 1-2-2007 and 2-2-2007 data.
# 
# Original source file found here
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# 
load_power_consumption <- function(){
    household_power_file <- "household_power_consumption.txt"
    if (!file.exists(household_power_file)){
      stop(paste("The file", household_power_file, "does not exist in the local directory."))
    }
    
    # Due to memory contraints, only a small set of the original data could be read into R.
    coltypes <- c( rep("character", 2), rep("numeric",7))
    powerconsumption   <- read.table(household_power_file, stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = c("?"),
                               colClasses = coltypes,
                               nrows = 70000)
    # Create datetime field
    library(lubridate)
    datetime <- dmy_hms(paste(powerconsumption$Date, powerconsumption$Time))
    powerconsumption <- cbind( datetime, powerconsumption)
    rm(datetime)
    
    # Subset dataframe for 1-2-2007 to 2-2-2007 date range
    powerconsumption_range <- powerconsumption[powerconsumption$datetime >= dmy("1/2/2007") & powerconsumption$datetime < dmy("3/2/2007"),]
    rm(powerconsumption)
    
    # Return results
    powerconsumption_range
}