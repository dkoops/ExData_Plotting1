#
# plot3.R
# This plot shows a line chart of Energy for each sub-meter
# over the sample set.
#
load_function <- "load_power_consumption.R"
if (!file.exists(load_function)){
  stop(paste("The load function file", load_function, "does not exist in the local directory."))
}
source(load_function)

power_consumption <- load_power_consumption()

# Plot a line chart
plot(power_consumption$datetime, power_consumption$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines( power_consumption$datetime, power_consumption$Sub_metering_1, col ="black")
lines( power_consumption$datetime, power_consumption$Sub_metering_2, col ="red")
lines( power_consumption$datetime, power_consumption$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)

# copy to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## close the PNG device
