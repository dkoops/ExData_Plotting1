#
# plot1.R
# This plot shows a histogram of Global active power over the sample set.
#
load_function <- "load_power_consumption.R"
if (!file.exists(load_function)){
  stop(paste("The load function file", load_function, "does not exist in the local directory."))
}
source(load_function)

power_consumption <- load_power_consumption()

# Plot histogram
hist(power_consumption$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# copy to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## close the PNG device
