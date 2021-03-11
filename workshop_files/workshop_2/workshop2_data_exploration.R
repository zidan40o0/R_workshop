library(readr)
library(tidyverse)
df1 <- 
  read_csv("workshop_files/workshop_2/supermarket_sales_sheet1.csv")

class(df1)
str(df1)
nrow(df1)
ncol(df1)
summary(df1)
sum(is.na(df1))
?grepl()
#start by doing the homework####
#Homework Assignment#
# 1- Make a new project
# 2- Pull the main git branch into your computer
# 3- Create a new branch in your repo and name it myname_homework1_sol
# 4- You see the file named "supermarket_sales - Sheet1.csv" in R, rename it according to the good practice we discussed then 
# import this file into a dataframe. 
# 5- What is the class of this data and what is its disk size?
# 6- Does this data have any factor variables? 
# 7- How many rows and columns it has?
# 8- Give basic statistics on the data at hand
# 9- Does it have any empty values? If so, where?
# 10- Explore the grepl() function, what does it do? (Please use the built-in documentation system by typing ?grepl() )
# 
# Bonus 1: 
#   Give the summary statistics of the first 100 rows for the unit_price column. (default ordering) 
# 
# Bonus 2: 
#   Illustrate at least three different methods to get data only from the seventh column 
# Extra Bonus 3: 
#   Keep only the rows that have Rating lower than the median 
# 
# Final Task:
#   Save, Commit and Push your script to your remote github repo with the comment "Done!". 

#Talk about R packages####
#what is a package? 
#the tidyverse which contains: 
 #dplyr 
 #ggplot2 
 #lubridate 
 #purrr 
#and much more 

#fliptime
#reshape2
#RPostgres
#keyring 
#jsonlite
#httr 

#mlr
#h2o

#how to install and load a package 

install.packages("keyring")
library(keyring)

install.packages("tidyverse")
library(tidyverse)
#freestyle exploration of the supermarket data #### 
 #explain the meaning of ID's and the importance of unique() 
 #look at the columns one by one 
 #do str() and explain why character isn't good 
 #notice the date
 #do a factor and also a date conversion 
 #sanity check the tax rate 
View(df1)

nrow(df1) == sum(!duplicated(df1$`Invoice ID`))

length(unique(df1$`Invoice ID`))

length(unique(df1$`Product line`))

unique(df1$`Product line`)
unique(df1$City)

unique(df1[,c("City", "Branch")])
unique(df1[,c("City", "Branch")])

#testing for similarity in gross margin and tax (probable error)

sum(!(df1$`Tax 5%` == df1$`gross margin percentage`))

sum((df1$`Tax 5%` == df1$`gross income`)) == 1000 #then a problem
sum(df1$`Tax 5%` == df1$`gross income`) != 0  #we have a problem 
#mutate()
#filter()

#dates and group by####
 #convert to weeks 

str(df1)
df1_clean <- 
  df1 %>% #from magrittr package
  mutate(., clean_date = mdy(Date)) %>% 
  filter(., clean_date < ymd("2019-03-08")) %>% 
  filter(., Gender == "Male") %>% 
  mutate(., testing_tax1 = 0.05*Total, 
            test_result = (testing_tax1 == `Tax 5%`), 
            test2 = ((`gross margin percentage` * Total) == `Tax 5%`))


df1_clean <- 
  df1 %>% #from magrittr package
  mutate(., clean_date = mdy(Date))

View(df1_clean)
df1_clean <- 
  df1 %>% 
  mutate(., clean_date = mdy(Date)) %>% 
  mutate(., the_months = month(clean_date, label = T, abbr = F), 
            the_days = wday(clean_date, label = T, abbr = F)) %>% 
  group_by(., the_months, Gender) %>% 
  summarize(., sales_per_gender_per_month = sum(Total))

df1_clean

 #convert to month 
 #convert to days
 #convert to years 
 #group by year, day, week, month 

#count number of members and non members for each gender 
library(tidyverse)
test <- 
  df1 %>% 
  group_by(., Gender) %>% 
  count(`Customer type`)

test
test

View(df)

nrow(df) #we have 1000 rows 
length(unique(df$`Invoice ID`)) #we indeed have 1000 unique IDs

the_unique_ids <- 
  unique(df$`Invoice ID`)

