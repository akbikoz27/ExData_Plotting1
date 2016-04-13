
datafile<-"household_power_consumption.txt"
data<-read.table(datafile,sep=";",stringsAsFactors = FALSE,header=TRUE,na.strings = "?")

s<-as.Date("01/02/2007",format="%d/%m/%Y")
e<-as.Date("02/02/2007",format="%d/%m/%Y")

sub<-data[as.Date(data$Date,format="%d/%m/%Y")>=s & as.Date(data$Date,format="%d/%m/%Y")<=e,]

tmstmp<-paste(sub$Date,sub$Time)

xgrid<-strptime(tmstmp,format="%d/%m/%Y %H:%M:%S")

png("plot4.png",height=480,width=480)

mfrow=c(2,2)

with(sub, plot(xgrid, as.numeric(Global_active_power),type="solid",ylab="Global Active Power",xlab=" "))

with(sub, plot(xgrid, Voltage,type="solid",ylab="Voltage",xlab=" "))

plot(xgrid,sub$Sub_metering_1,type="solid",col="black",ylab="Energy Sub Metering",xlab="")
lines(xgrid,sub$Sub_metering_2,type="solid",col="red", xlab="")
lines(xgrid,sub$Sub_metering_3,type="solid",col="blue", xlab="")

with(sub, plot(xgrid, Global_reactive_power,type="solid",ylab="Global_reactive_power",xlab="Datetime"))

dev.off()

