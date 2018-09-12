read_workbook <- function(workbook) {
    
    # A function for reading and saving all the sheets in an Excel workbook
    #
    # Arguments:
    # workbook  -   character string that is the path to the Excel workbook to read (.xls or .xlsx)
    
    
    require(readxl) # readxl package, part of the Tidyverse
    
    worksheets <- excel_sheets(workbook)
    
    for (worksheet in seq_along(worksheets)) { 
        assign(worksheets[worksheet], 
               value = read_excel(workbook, worksheet), 
               pos = 1) # puts the result in the Global environment
        }
    
}
