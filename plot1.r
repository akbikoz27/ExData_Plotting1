
datafile<-"household_power_consumption.txt"
data<-read.table(datafile,sep=";",stringsAsFactors = FALSE,header=TRUE)

s<-as.Date("01/02/2007",format="%d/%m/%Y")
e<-as.Date("02/02/2007",format="%d/%m/%Y")

sub<-data[as.Date(data$Date,format="%d/%m/%Y")>=s & as.Date(data$Date,format="%d/%m/%Y")<=e,]

png("plot1.png",width=480,height=480)

with(sub,hist(as.numeric(Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)"))

dev.off()









