source("./load-data.R")
t <- loadData()

png(filename = "plot2.png")
plot(t$Time,
     t$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Gloabl Active Power (kilowatts)")
dev.off()
