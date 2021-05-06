#Final Project
#Aaron Elledge

library(tidyverse)
library(readr)
library(ggplot2)

##Dataset was obtained on kaggle, it contains various statistics on all states about various health insurance information
#whether they got certain 
#Read Dataset
states <- read_csv('data/states.csv')
glimpse(states)
head(states)


#Clean to 50 states and only necessary rows for questions
#Dropped District of Columbia & United States total row
states <- states[-c(52, 9),]

states <- states[ , ! names(states) %in% c("Medicaid Enrollment (2013)", "Medicaid Enrollment (2016)", "State Medicaid Expansion (2016)")]
states

#Replacing NA values with the average from that column.
states$`Medicaid Enrollment Change (2013-2016)`[is.na(states$`Medicaid Enrollment Change (2013-2016)`)]<-mean(states$`Medicaid Enrollment Change (2013-2016)`, na.rm = TRUE)
view(states)


#How many people per region had a health insurance coverage change once ACA was signed? (bar plot)
per_region <- states %>%
  ggplot(aes(x = `State`, y = `Health Insurance Coverage Change (2010-2015)`)) +
  geom_col(position = 'dodge')+
  labs(x = "State",
       y = "Health Insurance Coverage Change 2010-2015",
       title = "Health Insurnace Coverage Change for each state between 2010-2015")
  
per_region + theme(axis.text.x = element_text(angle = 60, hjust = 1))


#What states had the most employer health insurance coverage?(line plot)

states %>%
  ggplot(aes(x =))


#What is the average monthly tax credit per person to the number of market place tax credits?

monthly_tax <- states %>%
  ggplot(aes(x = `Average Monthly Tax Credit (2016)`,
             y = `Marketplace Tax Credits (2016)`)) +
  geom_point()
monthly_tax + theme(axis.text.x = element_text(angle = 60, hjust = 1))


