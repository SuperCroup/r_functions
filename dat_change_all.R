# Often I work with multiple tbls that I import from CSV or Excel that have a date column
# that's in a character format -- instead of modifying each tbl individually to convert the
# date column into date format, it's handy to do them all in one go.
#
# I'm working on writing this as a function. As usual it's specific to me (e.g. the data that I 
# mostly use is stored in "dd mon yyyy" format, and with a column header that is always "date", 
# so I've written it specific to that, but future development will involve making it more
# generic and customizable.)


library(tibble)
library(dplyr)
library(purrr)
library(lubridate)


tbl_a <- tibble(date = c("17 Apr 1974", 
                         "29 May 1975", 
                         "21 Jan 1967", 
                         "12 Jan 1974", 
                         "06 Aug 1972"), 
                nickname = c("posh", 
                             "scary", 
                             "baby", 
                             "sporty", 
                             "ginger"))

tbl_b <- tbl_a
tbl_c <- tbl_a # copies for demonstration purposes


# Put the tbls in a named list - names should be identical to the variable names - or the 
# ultimate desired variable names of the output

all_tbls <- list(tbl_a = tbl_a, 
                 tbl_b = tbl_b, 
                 tbl_c = tbl_c)

# Each element of the list is a tbl. map() loops through the list and applies the function
# mutate() to each tbl; date = dmy(date) is passed to mutate() (three dots)
#
# Equivalent to     tbl_a <- tbl_a %>% mutate(date = dmy(date))
#                   tbl_b <- tbl_b %>% mutate(date = dmy(date))
# etc etc

all_tbls <- all_tbls %>% 
    map(mutate, date = dmy(date))


# Getting the tbls out of the list and back to individual objects (not strictly necessary
# because you can pull them out of the list as you need them, but I prefer to work with
# them individually as it feels a bit cleaner and is simpler)

for (tbl_index in seq_along(all_tbls)) assign(names(all_tbls)[tbl_index], all_tbls[[tbl_index]])

# And I usually remove all_tbls as well because it's not needed any more, and I am a bit of a
# scatter-brain so am liable to accidentally start working with that instead of what I should be
# working with,

rm(all_tbls)
