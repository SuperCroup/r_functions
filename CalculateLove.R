CalculateLove <- function(name1, name2){

# This function calculates romantic compatibility. 
# The arguments are two character vectors, each
# of length 1, which are the persons' names.
#
# For best results, try different variations of the names 
# (e.g including/excluding middle names, titles, initials 
# etc.) until you get the result you want.
  
  name1a <- unlist(strsplit(name1, ""))
  name2a <- unlist(strsplit(name2, ""))
  bothnames <- c(name1a, name2a)
  
  countL <- sum(bothnames == "L", bothnames == "l")
  countO <- sum(bothnames == "O", bothnames == "o")
  countV <- sum(bothnames == "V", bothnames == "v")
  countE <- sum(bothnames == "E", bothnames == "e")
  
  love <- c(countL, countO, countV, countE)
  
  while(length(love) > 2){
    require(zoo)
    love <- rollapply(love, 2, sum)
    love <- as.numeric(unlist(strsplit(as.character(love), "")))                
  }
  
  love <- paste(love, collapse="")
  love <- paste(love, "%", sep="")
  love
}
