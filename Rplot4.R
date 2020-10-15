Dataofpower=read.table(file = "D:/75e/IFMR/R project/household_power_consumption.txt",sep = ";",header = T)
subsetofpower=subset(Dataofpower,Dataofpower$Date=="1/2/2007"|Dataofpower$Date=="2/2/2007")
subsetofpower$Date=as.Date(subsetofpower$Date,format = "%d/%m/%y")
subsetofpower$Time=strptime(subsetofpower$Time,format = "%H:%M:%S")




par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subsetofpower,{
  plot(subsetofpower$Time,as.numeric(as.character(subsetofpower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subsetofpower$Time,as.numeric(as.character(subsetofpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subsetofpower$Time,subsetofpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subsetofpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subsetofpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subsetofpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subsetofpower$Time,as.numeric(as.character(subsetofpower$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})