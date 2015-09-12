#
# plot2.R
# This plot shows a line chart of Global active power over the sample set.
#
load_function <- "load_power_consumption.R"
if (!file.exists(load_function)){
  stop(paste("The load function file", load_function, "does not exist in the local directory."))
}
source(load_function)

power_consumption <- load_power_consumption()

# Plot a line chart
plot(power_consumption$datetime, power_consumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# copy to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## close the PNG device


