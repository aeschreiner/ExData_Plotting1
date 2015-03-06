plot1 <- function() {
    # read file
    hpc <- read.table('household_power_consumption.txt',
                      header=T,sep=';',na.strings='?')
    # select the 2 days of interest
    hpc2 <- hpc[(hpc$Date=='1/2/2007'|hpc$Date=='2/2/2007'),]
    # create a new colum of date/time type POSIXct
    hpc2$DateTime <-strptime(paste(hpc2$Date,hpc2$Time),
                             '%d/%m/%Y %H:%M:%S')
    rm(hpc)
    
    # open a png file for graphics output
    png('plot1.png',width=480,height=480,bg='darkgray')
    
    # plot a histogram, use custom axis annotation
    with(hpc2,
         hist(Global_active_power,main='Global Active Power',
          axes=F,
          xlab='Global Active Power (kilowatts)',
          col='red')
         )
    axis(1,at=c(0,2,4,6))
    axis(2,at=c(0,200,400,600,800,1000,1200))
    
    dev.off()
}