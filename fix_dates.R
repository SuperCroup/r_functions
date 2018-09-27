fix_dates <- function(tbl_list, date_col_name = date, date_fun = dmy) { 

# takes one or more tbls with dates that are in a *particular* character format that (e.g.) 
# read_excel() didn't automatically format as dates, formats the date correctly, and returns
# the tbls as individual tbls in the global environment, with the same names as the original
# input - the function does the assignment, so it's mainly useful for performing
# data <- mutate(data, col_name = dmy(col_name)) on multiple tbls
#
# tbl_list should be a character vector of tbl names
#
# date_col_name is the column name of the column with the dates to format
#
# date_fun is the function to use (any function really, but this function is for me and I 
# almost exclusively use this with lubridate::dmy()
#
# Limitations: at the moment this is a function I use for my work, so it's limited to what
# I use it for. Each tbl should have the column with the dates in have the same name, and they
# should be formatted roughly the same (e.g. "dd mmm yyyy")
    
    require(dplyr)
    require(purrr)
    require(lubridate)
    
    date_col_name <- enquo(date_col_name)
    date_name <- quo_name(date_col_name)
    
    tbl_list <- 
        mget(tbl_list, envir = as.environment(1)) %>%  # search global env
        map(mutate, !!date_name := date_fun(!!date_col_name))
    
    for (tbl_index in seq_along(tbl_list)) {
        
        assign(
            names(tbl_list)[tbl_index], 
            tbl_list[[tbl_index]], 
            pos = 1 # assign to global environment!
        )
        
    }
    
    
}
