coffee_ratings<- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv')

library(tidyverse)

skim(coffee_ratings)

#working on forcats on Tidyverse

#factors make data easy to tidy. 
#option 1 to convert on factors

coffee_ratings<-coffee_ratings%>%
  mutate(
    species=as_factor(species), 
    country_of_origin=as_factor(country_of_origin)
  )

#option 2

coffee_ratings$owner<-as_factor(coffee_ratings$owner)

coffee_ratings%>%count(country_of_origin, sort=TRUE)

coffee_ratings<-coffee_ratings%>%
  mutate(country_of_origin_lumped=fct_lump(country_of_origin, n=14))

coffee_ratings%>%count(country_of_origin_lumped, sort=TRUE)

coffee_ratings%>%ggplot(
  aes(country_of_origin_lumped, total_cup_points)) +
  geom_boxplot()

#use ggplot with geom_col where one variables is country of origin lumped and the other is your choice

coffee_ratings%>%ggplot(
  aes(country_of_origin_lumped, total_cup_points)) +
  geom_col()

#Assessment 2 key learnings!! Most used function...
coffee_ratings%>%
  mutate(
    country_of_origin_lumped=fct_reorder(country_of_origin_lumped, total_cup_points, sum, desc=TRUE)
    )%>%ggplot(
    aes(country_of_origin_lumped, total_cup_points)) +
  geom_col()+
  coord_flip()

#let's see the distribution/how spread out is the total cup points (because min. is 0 and then goes to 60)

coffee_ratings%>%ggplot(
  aes(total_cup_points)) +
  geom_histogram()

#let'see boxplot aswell
#next class

#Workshop 8 Notes

total_cup_points
cupper_points
acidity
aroma

country
altitude
moisture
species
region

#exploring data (EDA)
#what is my variation in my data

#example
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut), 
                                   fill="navy")

#my exploring in my coffee data

ggplot(data = coffee_ratings) + 
  geom_bar(mapping = aes(x=country_of_origin), 
                                   fill="navy") + 
  coord_flip()

#if I would like to remove the NA you add this in front of my code 
#coffee_ratings%>%
filter(!is.na(country_of_origin))%>%
  
#another example

#example from workshop notes
ggplot(data = diamonds) + geom_histogram(mapping = aes(x = carat), 
                                         binwidth = 0.5)
#my go with my coffee data

ggplot(data = coffee_ratings) + 
  geom_histogram(mapping = aes(x = cupper_points), 
                 binwidth = 0.5)
#linear regression
#x axis is independent variable, y axis is dependent variable

#using geom_smooth
  
  coffee_ratings%>%
    ggplot(
  aes(x = aroma, y = total_cup_points, colour=species)) +
  geom_point(size=0.5)+
  geom_smooth(method = lm, se=FALSE, colour="yellow")

#then with filter to increase focus on graph
  coffee_ratings%>%filter(aroma > 3)%>%
    ggplot(aes(x=aroma, y=total_cup_points, colour=species)) +
    theme_light() +
    labs(x= "Aroma Quality Score", y= "Total Cup Points Rating out of 100", title= "How Aroma Impacts Total Cup Points Rating", subtitle = "Workshop 8 Examples")+
    geom_point(size=0.5) +
    geom_smooth(method=lm, se=FALSE, colour="blue")

  #linear regression continued.

  #lm(dependent_variable~independent_variable) below is an example: 
  
results<-lm(total_cup_points~altitude_mean_meters+acidity, data=coffee_ratings)
summary(results)           

#other examples

lm(total_cup_points~aroma, data=coffee_ratings)
coffee_results<-lm(total_cup_points~aroma, data=coffee_ratings)
summary(coffee_results)

#always look at your adjusted R Square, the higher the number the better


  