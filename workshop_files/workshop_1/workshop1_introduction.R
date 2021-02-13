#Introduction####
#A bit of history and introduction to R as a whole and why and the difference between R and Rstudio 
#is it a very important tool in the world of data science
#Exploring R Studio and the different windows in it (script, environment, console, plot and help), 

#I added a new comment
#Git####
#Starting a new project, explain git and its benefits: 
 #1- version control (talk about the v1, v2, v3 problem)
 #2- Collaboration (why dropbox/mega/gdrive, and god forbid facebook is a very bad idea)
 #3- Backups and revert 

#importing data####
#Import data:
 #1- good practice in project and file naming
 #2- good practice when importing data through keeping a script
 #3- excel is one way, there is csv, SQL, json, and so on 

#basic functions ####
#Basic functions:
#View()
#str()
#summary()
#nrow()
#ncol()
#colnames()
#is.na() (explain exactly what NA means and why it is NOT ZERO)
#[,] operator
#$ operator 
#class() (string, factor, numerical, logical)

#classes ####
#Classes: 
#string example and explanation of quotation marks
 #pay attention to the three different marks (', ", ``) 

#example on factors (talk about ordinal)
#numeric example (should be easy)
#logical and apply mathematical operations on the logical
#introduce the which() function 

#Converting to a different class:
#as.numeric() (very useful when dealing with bad excel data that reads numbers as cahracters)
#as.character() 
#as.factor() 
#do a summary after each of these operations to show the difference use mtcars$gear as an exmaple


#shortcuts ####
#Shortcuts: 
 #delete line 
 #delete word 
 #move to beginning/end of line
 #move to beginning/end of word 
 #run current line 
 #run current line and jump to next 
 #comment everything 
 #find in script (ctrl + f) and replace 
 #find in directory
 # <- 
 # pipeline operator 
 #commit to git 