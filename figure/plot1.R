raw<-read.csv('household_power_consumption.txt',sep=';', colClasses = c("character","character","numeric","numeric","numeric","numeric"),na.strings="?")
raw$DateFormat<-as.Date(raw$Date,'%d/%m/%Y')
raw$DateTime<-paste(raw$Date,raw$Time,sep=' ')

dates<-c(as.Date('20070201','%Y%m%d'),as.Date('20070202','%Y%m%d'))
rawFiltered<-raw[raw$DateFormat %in% dates,]
rawFiltered$DateTime<-paste(rawFiltered$Date,rawFiltered$Time,sep=' ')
rawFiltered$DateTimeFormat<-strptime(rawFiltered$DateTime,'%d/%m/%Y %H:%M:%S')

windows()
if(dev.cur() == 1) dev.new()
with(rawFiltered,hist(Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)',ylab='Frequency'))
dev.copy(png,file='plot1.png')
dev.off()