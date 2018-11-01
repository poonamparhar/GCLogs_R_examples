extract_values_per_minute <- function(gc_data) {

  date_time <- as.POSIXlt(strptime(gc_data$V1, format="%Y-%m-%dT%H:%M:%OS"))
  mins <- format(date_time, "%M")
  
  pausetime <- 0
  before_sizes <- 0
  after_sizes <- 0
  young_sizes <- 0
  old_before_sizes <- 0
  old_after_sizes <- 0
  prev_m <- 0L
  pauses_vector <- vector()
  young_sizes_vector <-vector()
  eden_before_sizes <- vector()
  eden_after_sizes <- vector()
  old_before_sizes_vector <- vector()
  old_after_sizes_vector <- vector()
  i <- 1L
  j <- 1L
  entries_in_min <- 0L
  entries_per_min <- vector()
  
  for (j in 1:length(mins)) {
    m <- mins[j]
    if (j == 1) {
      prev_m <- m
    }
    pause <- gc_data$V5[j]
    before_size <- gc_data$V2[j]
    after_size <- gc_data$V3[j]
    
    young_size <- gc_data$V4[j]
    
    old_before_size <- gc_data$V6[j]
    old_after_size <- gc_data$V7[j]
    
    if (m == prev_m) {
      pausetime<-pausetime+pause
      
      entries_in_min = entries_in_min+1
      before_sizes <- before_sizes+before_size
      after_sizes <- after_sizes+after_size
      
      young_sizes <- young_sizes+young_size
      
      old_before_sizes <- old_before_sizes+old_before_size
      old_after_sizes <- old_after_sizes+old_after_size
    } else {
      pauses_vector[i]<-pausetime
      pausetime<-pause
      
      eden_before_sizes[i] <- before_sizes/entries_in_min
      eden_after_sizes[i] <- after_sizes/entries_in_min
      before_sizes <- before_size
      after_sizes <- after_size
      
      young_sizes_vector[i] <- young_sizes/entries_in_min
      young_sizes <- young_size
      
      old_before_sizes_vector[i] <- old_before_sizes/entries_in_min
      old_after_sizes_vector[i] <- old_after_sizes/entries_in_min
      old_before_sizes <- old_before_size
      old_after_sizes <- old_after_size
      
      entries_per_min[i] <- entries_in_min
      entries_in_min <- 1
      
      i<-i+1
      
    }
    prev_m <- m
    
  }
  vals_per_min <- data.frame(entries_per_min, pauses_vector, young_sizes_vector, eden_before_sizes, eden_after_sizes, old_before_sizes_vector, old_after_sizes_vector)
}