coffee_ratings<- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv')

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


