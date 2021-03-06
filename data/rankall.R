rankall <- function(outcome, num = "best") {
        ## Read outcome data
        wd <- getwd()
        print(wd)
        if(wd == "C:/Users/Fujitsu/Documents") {
                old.dir <- getwd()
                old.dir
                setwd("C:\\Users\\Fujitsu\\Documents\\Kevy\\R Programming\\Week 4\\Programming Assignment 3\\prog-assign-3\\data")
                getwd()                
        }

        #test <- read.csv("outcome-of-care-measures.csv", colClasses = "character", 
        #                 na.strings="Not Available", stringsAsFactors=FALSE)
        test <- read.csv("outcome-of-care-measures.csv", 
                         na.strings="Not Available", stringsAsFactors=FALSE)
        
        ## Check that state and outcome are valid
        shortoutcomeslist = c("heart attack", "heart failure", "pneumonia")
        outcomeslist = c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                         "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                         "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
        comp <- outcome == shortoutcomeslist
        logicTest <- shortoutcomeslist[comp]
        
        validOutcome <- identical(logicTest, character(0))
        if(isTRUE(validOutcome)) { 
                stop('invalid outcome')
        }
        
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        if(!isTRUE(validOutcome)) {
                sub2 = test[test$State == state, c("State", "Hospital.Name", outcomeslist)]
                setnames(sub2, old=c(outcomeslist), new=c(shortoutcomeslist))
                sub3 = sub2[!is.na(sub2[eval(outcome)]), c("State", "Hospital.Name", eval(outcome))]
                listOfVariables <- c(eval(outcome), "Hospital.Name")
                print(head(sub3))
                sub7 <- sub3[order(sub3[,3], sub3[,2]),]
                print(head(sub7))
                print(sub7)
                if(num == 'worst') {
                        print(sub7[nrow(sub7),]$Hospital.Name)
                }
                else if(num == 'best') {
                        print(sub7[1,]$Hospital.Name)                        
                }
                else if(is.numeric(num)) {
                        print(sub7[eval(num),]$Hospital.Name)                        
                }
        }
}

allHospitals <- rankall("heart attack", "worst")
allHospitals <- rankall("hert attack", "worst")