#set file name, may change to suit your own directory
fileName="household_power_consumption.txt";
df=read.table(fileName, header=TRUE, sep=";", na.strings="?",colClasses = c("character", "character", rep("numeric",7)));

#formatting string into date
df$Date=as.Date(df$Date,format="%d/%m/%Y");

#subsetting
dfsub=subset(df, Date==as.Date("2007-02-01") |Date==as.Date("2007-02-02"));

#construct datetime column for later use
datetime=strptime(paste(dfsub$Date, dfsub$Time), "%Y-%m-%d %H:%M:%S");
dfsub=cbind(datetime, dfsub[,-(1:2)]);

#preparing png device
png(filename="plot2.png", width=480, height=480, units="px");
plot(dfsub$Global_active_power ~ dfsub$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off();     

