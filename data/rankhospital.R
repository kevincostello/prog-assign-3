rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
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

        carbsx <- sapply(test["State"], unique)
        carbsy <- unlist(carbsx)
        comp2 <- state == carbsy
        logicTest2 <- carbsy[comp2]

        validState <- identical(logicTest2, character(0))
        if(isTRUE(validState)) {
                stop('invalid state')
        }
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        if(!isTRUE(validOutcome) && !isTRUE(validState)) {
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

#selectHospital <- rankhospital("TX", "heart failure", 4)
selectHospital <- rankhospital("MD", "heart attack", "worst")
#selectHospital <- rankhospital("MN", "heart attack", 5000)
#selectHospital <- rankhospital("BB", "heart attack", 4)
#selectHospital <- rankhospital("BB", "hert attack", 4)
#selectHospital <- rankhospital("NY", "hert attack", 4)