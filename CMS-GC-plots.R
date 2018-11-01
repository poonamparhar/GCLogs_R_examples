setwd("/Users/pobajaj/Poonam_files/Presentations/OC1_2018/R-examples/CMS-GC/")

#filename <- "gc_data1.dat"
filename <- "gc_data3.dat"   #young size=1.8g
gc_data <- read.table(filename)
date_time <- as.POSIXlt(strptime(gc_data$V1, format="%Y-%m-%dT%H:%M:%OS"))
options(scipen=5)

#scatter plot for GC pauses
plot(gc_data$V5, col="purple", ylab = "Individual GC Pauses")

# plot GC events frequency
plot(date_time, seq_along(date_time), col="blue")

# plot Eden size before GC 
plot(gc_data$V2, col="green", type="p", ylab = "Young Occupancy Before GC")

# plot eden size after GC 
plot(gc_data$V3, col="blue", type="l", ylab = "Young Occupancy After GC")

#plot young gen size
plot(gc_data$V4, col="red", type="l", ylab = "Young Gen Size")

# plot heap occupancy before and after GC 
plot(gc_data$V6, col="green", type="l", ylab = "Heap Occupancy Before GC")
plot(gc_data$V7, col="blue", type="l", ylab = "Heap Occupancy After GC")
