source("./load-data.R")
t <- loadData()

png(filename = "plot4.png")

# Setup plot space into 4 segements
par(mfcol=c(2,2),mar=c(4,4,2,1))

# Copy & paste code from existing plots

# (topleft) Plot 2
plot(t$Time,
     t$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Gloabl Active Power")

# (bottomleft) Plot 3
plot(t$Time, t$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab ="")
points(t$Time, t$Sub_metering_1, col = "black", type="l")
points(t$Time, t$Sub_metering_2, col = "red", type="l")
points(t$Time, t$Sub_metering_3, col = "blue", type="l")
legend("topright", col = c("black", "red", "blue"), lwd = 1, legend = names(t[c(6,7,8)]))

# (topright) datetime ~ Voltage
plot(t$Time, 
     t$Voltage, 
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

# (bottomright) datetime ~ global reactive power
plot(t$Time,
     t$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off()

