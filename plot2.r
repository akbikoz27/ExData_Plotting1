
datafile<-"household_power_consumption.txt"
data<-read.table(datafile,sep=";",stringsAsFactors = FALSE,header=TRUE,na.strings = "?")

s<-as.Date("01/02/2007",format="%d/%m/%Y")
e<-as.Date("02/02/2007",format="%d/%m/%Y")

sub<-data[as.Date(data$Date,format="%d/%m/%Y")>=s & as.Date(data$Date,format="%d/%m/%Y")<=e,]

tmstmp<-paste(sub$Date,sub$Time)

xgrid<-strptime(tmstmp,format="%d/%m/%Y %H:%M:%S")

png("plot2.png",height=480,width = 480)

with(sub, plot(xgrid, as.numeric(Global_active_power),type="solid",ylab="Global Active Power (kilowatts)",xlab=" "))


dev.off()



