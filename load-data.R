
loadData <- function() {
    # Retrieve and unzip data
    f <- "household_power_consumption.txt"
    if (!file.exists(f)) {
        z <- "household_power_consumption.zip"
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", z, method = "curl")
        unzip(z)
    }

    # Nine columns
    #
    # Date: Date in format dd/mm/yyyy
    # Time: time in format hh:mm:ss
    # Global_active_power: household global minute-averaged active power (in kilowatt)
    # Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
    # Voltage: minute-averaged voltage (in volt)
    # Global_intensity: household global minute-averaged current intensity (in ampere)
    # Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
    # Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
    # Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.


    # Only read in the required rows (01/Feb/2007 - 02/Feb/2007)
    # Found with:
    #  grep -n '^1/2/2007' household_power_consumption.txt | head -n1
    # NOTE: this could be done in R, but linux CLI tools makes this very
    #       easy to find out. The downside is that this will fail if the data
    #       ever changes. In the scope of this exercise I didn't see the benefit.
    #
    # nrows == 60(mins) * 24(hours) * 2(days) == 2880
    t <- read.table(f,
                    sep=";",
                    header = FALSE,
                    na.strings = "?",
                    skip = 66637,
                    nrows = 2880,
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

    # Read in the first line from the txt file for the header names, and set them on the data frame
    names(t) <- names(read.table(f, sep=";", header = TRUE, nrows = 1))

    # Convert date + time columns into one time column
    datetime <- strptime(paste(t$Date, t$Time, sep=","), format = "%d/%m/%Y,%H:%M:%S")
    t$Time <- datetime

    # Original 'Date' column can be omitted
    subset(t, select = -Date)
}
