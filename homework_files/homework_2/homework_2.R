#Using the same supermarket data from homework 1 please do the following:
#1 - Install and load the tidyverse package
install.packages("tidyverse")
library(tidyverse)
#2 - What is the most profitable way of payment for the supermarket?
df1

unique(df1$Payment)
payment_profits <- 
  df1 %>% 
  group_by(., Payment) %>% 
  summarize(., total_sales = sum(`gross income`))

payment_profits
#3 - What is the most popular way of payment among females?

payment_profit_gender <- 
  df1 %>% 
  group_by(., Gender, Payment) %>% 
  summarize(., total_sales_per_gender = sum(`gross income`)) %>% 
  filter(., Gender == "Female")

View(payment_profit_gender)
#4 - Which product lines have the poorest rating (on average)?
avg_per_line <- 
  df1 %>% 
  group_by(., `Product line`) %>% 
  summarize(., avg_rating = mean(Rating))

avg_per_line

#5 - For each of the branches calculate and print in a single table:
  # A- the average sale per customer for each branch.
  # B- The total units sold per branch. 
  # C- The number of customers per branch

branch_analysis <- 
  df1 %>% 
  group_by(., Branch) %>% 
  summarize(., avg_sale = mean(Total), total_units = sum(Quantity), number_customers = n(), median_sales = median(Total), std_dev = sd(Total))

branch_analysis

#6- In a seperate table calculate the total sales per month per branch
#7- Which branch had the highest level of sales coming from females during March?
library(lubridate)
class(df1$Date)
library(flipTime)
sales_in_march <- 
  df1 %>% 
  mutate(., name_of_month = month(AsDate(Date), label = T, abbr = F)) %>% 
  group_by(., Gender, Branch, name_of_month) %>% 
  summarize(., total_sales = sum(Total)) %>% 
  filter(., Gender == "Female", name_of_month == "March")

sales_in_march
#8- Assume a tax rate of 7%, create the new corresponding columns to reflect this change. 

new_tax <- 
  df1 %>% 
  mutate(., new_tax_7percent = 0.07*Total)
View(new_tax)
#9- Assume that branch A had a mistake in ratings, to fix this you have to reduce all the ratings for that branch by 10%,
#   create a new column to reflect this change and round the result to the nearst tenth decimal (hint: explore the round() function)
#10- Your manager only wants to see the results and the analysis for those who paid with Cash, how would you omit the others?

