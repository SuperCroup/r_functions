packages_to_load <- list("tidyverse", "scales", "knitr", "lubridate", 
						 "RColorBrewer", "readxl", "kableExtra", "glue", "janitor")

lapply(packages_to_load, library, character.only = TRUE)

rm(packages_to_load)
