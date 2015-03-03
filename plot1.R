## as I'm runnin different locale settings, I need to change to English
Sys.setlocale("LC_TIME", "English")

## Read data from the file, file should be on the same dir as this code file
powerData<-read.csv2("household_power_consumption.txt",dec=".", na.strings = "?")

##subsetting based on given dates
##2007-02-01 and 2007-02-02
subData<-powerData[(powerData$Date=="1/2/2007" | powerData$Date=="2/2/2007" ),]

## Modify Date & Time to 1 column reprsesenting correct date and time data
dateandtime<-strptime( paste(subData[,1], subData[,2]), "%d/%m/%Y %T")
subData$DateAndTime<-dateandtime



##exporting the plot to the file
png(filename="plot1.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))


## Generating the histogram for Global_active_power
hist(subData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")


##closing the file
dev.off()



