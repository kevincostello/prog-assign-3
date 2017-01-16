best <- function(state, outcome) {
        outcomeslist = c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                         "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                         "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
        shortoutcomeslist = c("heart attack", "heart failure", "pneumonia")
        longlist = list(olist = outcomeslist, slist = shortoutcomeslist)
        for (i in seq_along(shortoutcomeslist)) {
                if(shortoutcomeslist[i] == outcome) {
                        #use paste function to create print to screen
                        longoutcome = outcomeslist[i]
                        sub = test[test$State == state, c("State", "Hospital.Name", outcomeslist[i])]
                        sub2 = test[c("State", "Hospital.Name", outcomeslist[i])]

                        # Create list of unique states
                        carbsx <- lapply(sub2["State"], unique)

                        #place into a character variable
                        carbsy <- unlist(carbsx)
                        
                        #Loop through unique values of state to check against input value from user
                        for(j in seq_along(carbsy)) {
                                #Process data if state is in the list
                                if(carbsy[j] == state) {
                                        outsub = sub[longoutcome]
                                        L = sub[sub[longoutcome] != "Not Available", c("State", "Hospital.Name", longoutcome)]
                                        L$hospx <- as.numeric(L[[longoutcome]])
                                        L$factstate <- factor(L$State)
                                        L$liststate <- list(L$State)
                                        Z = L[L$hospx == min(L$hospx), ]
                                        print(Z$Hospital.Name)
                                        break
                                }
                                #Otherwise tell user that the state value is not valid
                                else if (j == length(carbsy)) {
                                        for (k in seq_along(shortoutcomeslist)) {
                                                if(shortoutcomeslist[k] == outcome) {
                                                        #use paste function to create print to screen
                                                        stop(paste("Error in best(","\"", state,"\"","\"", outcome, "\"","): invalid state"))                                        
                                                }
                                        }
                                }
                        }
                        break
                }
                else if (i == 3) {
                        stop(paste("Error in best(","\"", state,"\"","\"", outcome, "\"","): invalid outcome"))                                          
                }
        }
}

onlystate <- best("TX", "heart attack")
onlystate <- best("TX", "heart failure")
onlystate <- best("MD", "heart attack")
onlystate <- best("MD", "pneumonia")
onlystate <- best("BB", "heart attack")
onlystate <- best("NY", "hert attack")