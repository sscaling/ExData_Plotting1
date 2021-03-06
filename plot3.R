source("./load-data.R")
t <- loadData()

png(filename = "plot3.png")
plot(t$Time, t$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab ="")
points(t$Time, t$Sub_metering_1, col = "black", type="l")
points(t$Time, t$Sub_metering_2, col = "red", type="l")
points(t$Time, t$Sub_metering_3, col = "blue", type="l")
legend("topright", col = c("black", "red", "blue"), lwd = 1, legend = names(t[c(6,7,8)]))
dev.off()