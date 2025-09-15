library(tidyverse)
library(gapminder)
library(nycflights13)
library(socviz)
library(ggplot2movies)


# the package socviz is associated with the textbook
# Data Visualization A practical introduction by Kieran Healy
socviz::gss_sm

# basic bar chart
ggplot(data = gss_sm, mapping = aes(x = bigregion)) +
  geom_bar()

# use after_stat for proportion
# this doesn't look right
ggplot(data = gss_sm, mapping = aes(x = bigregion)) +
    geom_bar(aes(y = after_stat(prop)))
# use group = 1
ggplot(gss_sm, aes(x = bigregion)) +
  geom_bar(aes(y = after_stat(prop), group = 1))

# Your time - geom_col()
# There is also a geometry called geom_col() that does something similar.
# Read the example in the documentation with ?geom_col() and create the two plots above using geom_col().




###################################################################################################
###################################################################################################
# use fill to show two categorical variable - is it good?
gss_sm |>
  ggplot(aes(x = bigregion, fill = religion)) +
  geom_bar()

# different position layouts
gss_sm |>
  ggplot(aes(x = bigregion, fill = religion)) +
  geom_bar(position = "fill")

gss_sm |>
  ggplot(aes(x = bigregion, fill = religion)) +
  geom_bar(position = "dodge")

# switching the x axis and fill allows you to make different comparisons
gss_sm |>
  ggplot(aes(x = religion, fill = bigregion)) +
  geom_bar(position = "dodge")


# this the same with use the x-axis and the facet
gss_sm |>
  ggplot(aes(x = religion)) +
  geom_bar() +
  facet_wrap(vars(bigregion))

gss_sm |>
  ggplot(aes(x = bigregion)) +
  geom_bar() +
  facet_wrap(vars(religion))


# Your time - explore arguments in `facet_wrap()`
# Start from this base plot
gapminder |>
  ggplot(aes(x = year, y = lifeExp,
             group = country)) +
  geom_line() +
  facet_wrap(vars(continent))

# Make the following changes:
# 1) Arrange the panel to be 3 rows and 2 columns?




# 2) Apply a local scale for the y-axis for each individual panel
# Would you say a global scale or a local scale is better in this plot?




# 3) Change the facet label header to “continent: Africa”, “continent: Americas”,
# Would you say it is a god change to make in this plot?





###################################################################################################
###################################################################################################
ggplot2movies::movies

# this doesn't look right - what should we do next?
movies |>
  ggplot(aes(x = length)) +
  geom_histogram()

# again - what should we do next?
movies |>
  filter(length < 2000) |>
  ggplot(aes(x = length)) +
  geom_histogram()

movies |>
  filter(length < 300) |>
  ggplot(aes(x = length)) +
  geom_histogram()


# change `bins` and `binwidth`
movies |>
  filter(length < 200) |>
  ggplot(aes(x = length)) +
  geom_histogram(bins = 5)

movies |>
  filter(length < 200) |>
  ggplot(aes(x = length)) +
  geom_histogram(bins = 50)

movies |>
  filter(length < 200) |>
  ggplot(aes(x = length)) +
  geom_histogram(binwidth = 10)

movies |>
  filter(length < 200) |>
  ggplot(aes(x = length)) +
  geom_histogram(binwidth = 1)


## Your time - practice after_stat()
# Sometimes we may want to overlay the density on top of the histogram, but the plot from the following code doesn’t seem to work as expected:
movies |>
  filter(length < 200) |>
  ggplot(aes(x = length)) +
  geom_histogram(binwidth = 10) +
  geom_density(color = "red", linewidth = 1.5)

# Can you read through the Computed variables section in geom_density() to plot the histogram and density together?




###################################################################################################
###################################################################################################
