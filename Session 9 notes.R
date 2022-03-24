## Session 8

# Classifications:

Inputs can be continuous, categorical or mix
Outputs should be a category

e.g. Classify if your email is spam or not?
  
  
# Regression vs Classification

Regression e.g. What is the weather temp going to be tomorrow?
  Classification e.g. Will it be Hot or Cold? 

  ## Assessment 2 notes
  
  Step 1: Do it in your console

install.packages("randomForest")

Step 2: Load library do this everytime!
  
library(randomForest)

randomForest(formula, data=NULL, ..., subset, na.action=na.fail) follow this process!
  

  rf<-randomForest(Species~.,) data=train, proximity=TRUE) print(rf)



when you add dot its a short cut to add the entire variables.



###

