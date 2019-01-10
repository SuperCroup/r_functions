# converts character vector of time periods in the format "mm:ss" to numeric vector
# of time periods in seconds

minutes_seconds <- function(x) { 
  require(purrr)
  require(stringr)
  
  x %>% 
    str_split(":") %>% 
    map(as.numeric) %>% 
    map_dbl(function(x) sum(x* c(60, 1)))
  
}
