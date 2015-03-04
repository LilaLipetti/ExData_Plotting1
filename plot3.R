
## This code requires data from the UC Irvine Machine Learning Repository.
## Downlaod “Individual household electric power consumption Data Set” 
## See https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

## Download the archive
## https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip
## and unzip to same directory than this file
## This zip should contain household_power_consumption.txt



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
png(filename="plot3.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))


## Generating 1st line graph for Sub meterings
plot(subData$DateAndTime,subData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

##adding 2nd line
lines(subData$DateAndTime,subData$Sub_metering_2,type="l",col="red")

##adding 3nd line
lines(subData$DateAndTime,subData$Sub_metering_3,type="l",col="blue")

##adding legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))


##closing the file
dev.off()
