old.dir <- getwd()
old.dir
setwd("C:\\Users\\Fujitsu\\Documents\\Kevy\\R Programming\\Week 4\\Programming Assignment 3\\prog-assign-3\\data")
getwd()
#test <- read.csv("outcome-of-care-measures.csv", colClasses = "character", 
#                 na.strings="Not Available", stringsAsFactors=FALSE)
test <- read.csv("outcome-of-care-measures.csv", 
                 na.strings="Not Available", stringsAsFactors=FALSE)
