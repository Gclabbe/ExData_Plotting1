# program to read in data from the Household Power Consumption data used in
# the Johns Hopkins University Exploring Data class

# read the data in with read.csv.  Need to change the separator to match the file
houseData <- read.csv("twodays.csv", sep = ";", na.strings = "?") # , nrows = 1000)
houseData[[1]] <- as.Date(houseData[[1]], format = "%d/%m/%Y")  # convert col 1 to date format
# houseData[[2]] <- strptime(houseData[[2]], format = "%H:%M:%S") # convert col 2 to time format

# setup to print the graph into a png file
png(file = "plot1.png", height = 640, width = 640)

# generate histogram of the global active power data
hist(houseData[["Global_active_power"]], xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

dev.off()