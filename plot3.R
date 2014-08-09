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
png(filename="plot3.png", width=480, height=480, units="px");
with(dfsub, 
     {plot(Sub_metering_1 ~ datetime, type = "l", main = "", ylab = "Energy sub metering", xlab = "")
     #Add the lines for the sub_2, colored red
     lines(Sub_metering_2 ~ datetime, col = "Red")
     #Add the lines for the sub_3, colored blue
     lines(Sub_metering_3 ~ datetime, col = "Blue")
     legend('topright', 
            c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            lty = c(1,1,1),
            col = c('black', 'red', 'blue'))})
dev.off();     

