# program to read in data from the Household Power Consumption data used in
# the Johns Hopkins University Exploring Data class

# read the data in with read.csv.  Need to change the separator to match the file
houseData <- read.csv("twodays.csv", sep = ";", na.strings = "?") # , nrows = 1000)
houseData[[1]] <- as.Date(houseData[[1]], format = "%d/%m/%Y")  # convert col 1 to date format
# houseData[[2]] <- strptime(houseData[[2]], format = "%H:%M:%S") # convert col 2 to time format

# setup to print the graph into a png file
png(file = "plot3.png", height = 640, width = 640)

# line plot of the active power by HMS time-series.  Have to combine the date & time columns to achieve this
plot(strptime(paste(houseData$Date, houseData$Time), "%Y-%m-%d %H:%M:%S"), houseData[["Sub_metering_1"]], ylab = "Energy Sub Metering", xlab = "", type = "l")
lines(strptime(paste(houseData$Date, houseData$Time), "%Y-%m-%d %H:%M:%S"), houseData[["Sub_metering_2"]], type = "l", col = "red")
lines(strptime(paste(houseData$Date, houseData$Time), "%Y-%m-%d %H:%M:%S"), houseData[["Sub_metering_3"]], type = "l", col = "blue")

# build the chart legend
legend("topright", names(houseData)[7:9], lty=c(1, 1, 1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red","blue"))

dev.off()