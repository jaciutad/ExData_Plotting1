raw<-read.csv('household_power_consumption.txt',sep=';', colClasses = c("character","character","numeric","numeric","numeric","numeric"),na.strings="?")
raw$DateFormat<-as.Date(raw$Date,'%d/%m/%Y')
raw$DateTime<-paste(raw$Date,raw$Time,sep=' ')

dates<-c(as.Date('20070201','%Y%m%d'),as.Date('20070202','%Y%m%d'))
rawFiltered<-raw[raw$DateFormat %in% dates,]
rawFiltered$DateTime<-paste(rawFiltered$Date,rawFiltered$Time,sep=' ')
rawFiltered$DateTimeFormat<-strptime(rawFiltered$DateTime,'%d/%m/%Y %H:%M:%S')

windows()
if(dev.cur() == 1) dev.new()
with(rawFiltered,plot(DateTimeFormat,Sub_metering_1,type="l",xlab='',ylab='Energy sub metering',col="black")) 
with(rawFiltered,lines(DateTimeFormat,Sub_metering_2,col="red")) 
with(rawFiltered,lines(DateTimeFormat,Sub_metering_3,col="blue")) 
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, cex=.65)
dev.copy(png,file='plot3.png')
dev.off()