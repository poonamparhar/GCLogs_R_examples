setwd("/Users/pobajaj/Poonam_files/Presentations/OC1_2018/R-examples/CMS-GC/")

#filename <- "gc_data1.dat"   #young size=600m
filename <- "gc_data3.dat"   #young size=1.8g
gc_data <- read.table(filename)
options(scipen=5)
gc_vals_per_min <- extract_values_per_minute(gc_data)

# plot GC pauses per minute
plot(gc_vals_per_min$pauses_vector, col="blue", ylab = "GC Pauses Per Minute", xlab = "Time in Minutes")

# plot GC frequency per minute
plot(gc_vals_per_min$entries_per_min, col="red", ylab = "GC Frequency", xlab = "Time in Minutes")

plot(gc_vals_per_min$eden_before_sizes, type="p", col="green", ylim = c(1700000, 1800000), ylab = "Young Occupancy Before GC", xlab = "Time in Minutes")

plot(gc_vals_per_min$eden_after_sizes, type="l", col="blue", ylab = "Young Occupancy After GC", xlab = "Time in Minutes")

plot(gc_vals_per_min$old_before_sizes_vector, type="l", col="green", ylab = "Heap Occupancy Before GC", xlab = "Time in Minutes")

plot(gc_vals_per_min$old_after_sizes_vector, type="l", col="blue", ylab = "Heap Occupancy After GC", xlab = "Time in Minutes")


