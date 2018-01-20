
source("./load-data.R")
t <- loadData()

png(filename = "plot1.png")
hist(t$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
