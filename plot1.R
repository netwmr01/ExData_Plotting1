#set file name, may change to suit your own directory
fileName="household_power_consumption.txt";
df=read.table(fileName, header=TRUE, sep=";", na.strings="?",colClasses = c("character", "character", rep("numeric",7)));

#formatting string into date
df$Date=as.Date(df$Date,format="%d/%m/%Y");

#subsetting
dfsub=subset(df, Date==as.Date("2007-02-01") |Date==as.Date("2007-02-02"));

#preparing png device
png(filename="plot1.png", width=480, height=480, units="px");
hist(dfsub$Global_active_power,col='red',xlab= 'Global Active Power', main='Global Active Power (kilowatts)');
dev.off();     

