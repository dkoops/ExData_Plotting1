#
# plot4.R
# This plot shows a multi plot chart of Energy usage over the sample set.
#
load_function <- "load_power_consumption.R"
if (!file.exists(load_function)){
  stop(paste("The load function file", load_function, "does not exist in the local directory."))
}
source(load_function)

power_consumption <- load_power_consumption()

# Multi plot a chart
png(file = "plot4.png", width = 480, height = 480)
with(
  power_consumption, {
    par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
    
    # plot 1 - Top Left
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    
    # plot 2 - Top Right
    plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    # plot 3 - Bottome Left
    plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(datetime, Sub_metering_1, col = "black")
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n")
    
    # plot 4 - Bottom Right
    plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  }
)
# copy to png file
#dev.copy(png, file = "plot4.png", width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## close the PNG device
