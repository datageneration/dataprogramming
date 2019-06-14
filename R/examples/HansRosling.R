## Generating Hans Rosling's animated chart

install.packages("tidyverse")
install.packages("gganimate")
install.packages("gapminder")
install.packages("ggplot2")
install.packages("gifski")
install.packages("png")
library(tidyverse)
library(gapminder)
library(ggplot2)
library(gganimate)
library(gifski)
library(png)
install.packages("dplyr")
data("gapminder")
# Basic scatter plot object

mapping <- aes(x =gdpPercap, y = lifeExp, 
               size = pop, color = continent,
               frame = year) 

# Note: manual color choices.

ggplot(gapminder, mapping = mapping) +
  geom_point() +
  theme_linedraw() + 
  scale_x_log10()+
  scale_color_manual(values=c("orange","light green","red","dark blue","brown")) +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  geom_text(aes(label=ifelse((gapminder$country == "China"), "China", ifelse(gapminder$country=="Taiwan", "Taiwan", ""))),vjust=0,nudge_y = 1,size=6) + 
  transition_time(year) +
  ease_aes('linear')

