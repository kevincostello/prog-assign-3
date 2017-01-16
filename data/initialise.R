old.dir <- getwd()
old.dir
setwd("C:\\Users\\Kevin\\Documents\\Kevy\\R Programming\\Week 4\\Programming Assignment 3\\data")
getwd()
test <- read.csv("outcome-of-care-measures.csv", colClasses = "character")