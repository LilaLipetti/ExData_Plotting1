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
png(filename="plot4.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))


#setting the drawing plot area to include 2*2 different plots
par(mfrow=c(2,2))


## top left : 
## Generating line graph for Global Active Power
plot(subData$DateAndTime,subData$Global_active_power,type="l",xlab="",ylab="Global Active Power")


## top right: Generating line graph for Voltage
plot(subData$DateAndTime,subData$Voltage,type="l",xlab="datetime",ylab="Voltage")


## bottom left : Generating line graph for Energy Sub meterings
plot(subData$DateAndTime,subData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(subData$DateAndTime,subData$Sub_metering_2,type="l",col="red")
lines(subData$DateAndTime,subData$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))


## bottom right: Generating line grap for Global Reactive Power
plot(subData$DateAndTime,subData$Global_active_power,type="l",xlab="datetime",ylab="Global_active_power")


##closing the file
dev.off()
