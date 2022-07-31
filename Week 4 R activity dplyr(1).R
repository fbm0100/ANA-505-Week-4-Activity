#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
HairEyeColor
data.frame(HairEyeColor) -> beauty_data


#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(beauty_data)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages ("dplyr")
library(dplyr)

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
beauty_data %>% select(Hair,Sex)

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as a new dataset
#and give it a name
ideal.df <- select(beauty_data,Hair,Sex)
ideal.df
#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
ideal.df %>% select(!(Sex))

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
live <- ideal.df %>% rename (Gender =Sex)
live
#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
perfect <- live
perfect
#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
Male_only1 <- perfect %>% filter(Gender=="Male")
#or
#solution 2
Male_only<-live%>%select(Gender)%>%filter(Gender=="Male")
Male_only
#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
group1<-perfect%>%group_by(Gender)
group1


#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#After you run it, write the total here:_592___
total=mutate(beauty_data, total=cumsum(Freq))
total

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
female_only1 <- perfect %>% filter(Gender=="Female")
female_only1
#or
#solution 2
female_only<-live%>%select(Gender)%>%filter(Gender=="Female")
female_only

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
bind_rows(female_only,Male_only)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
dplyr::arrange(beauty_data,by_group=TRUE)
