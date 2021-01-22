# The purpose of bar plots are to display continuous (or numeric)
# values on the y-axis for different categorical (or discrete)
# values on the x-axis. Bar plots would be good for showing
# the price of four different items in a store. But a bar 
# plot would not be good for showing how those prices
# change over time.

# Chang stresses the important distinction in bar plots
# when bar heights represent counts of cases in the data
# versus when the bar heights represent values in the data.
# He says this can be a source of confusion, and I agree.
# But this chapter will explain the recipes used for both
# types of bar plots.

# Before we begin, we need to load in the tidyverse package
# for ggplot2 and other important packages. We also need
# to install and load in the gcookbook library as it comes
# with many data sets that will be used in example recipes.

## install.packages("gcookbook")
library(tidyverse)
library(gcookbook)


# Before we get into plotting, run this piece of code
# and it will help see out plots better.

theme_set(theme_bw())

# Basic Bar Plot ------------------------------------------------- 2:00

# To make a simple bar plot, we add the geom_col() layer to
# the ggplot() function call. This is for when we have a data 
# frame where one column of values can be mapped to the x-axis 
# and the other column's values can be mapped to heights
# represented by the y-axis.

pg_mean

# We will use the pg_mean data frame. We will map "group"
# to the x-axis and "weight" to the y-axis.

ggplot(pg_mean, aes(x = group, y = weight)) +
  geom_col()

# Now, this is Chang's preferred method for writing ggplot
# commands. I'm going to be demonstrating a different 
# way; one that incorporates the piping operator that 
# we saw in the last video. This method will help us
# later down the line when we want to add filters
# and other functions to our data frame before we plot it.

pg_mean %>% 
  ggplot(aes(x = group, y = weight)) +
  geom_col()


# When the x-axis has a continuous variable mapped to
# it, the bars will behave slightly differently.

BOD %>%
  str()

# "Time" in BOD is numeric

BOD %>%
  ggplot(aes(x = Time, y = demand)) +
  geom_col()

# When we coerce "Time" to as a factor...

BOD %>%
  ggplot(aes(x = as.factor(Time), y = demand)) +
  geom_col()

# Notice the difference.

# We can add color to the plots. If you want to fill
# in the bars with color, use the fill arugment; if you
# want to add an outline, use the color argument. Both of
# which will be set outside the aes(). Look at the 
# following example. 

pg_mean %>%
  ggplot() +
  geom_col(aes(x = group, y = weight),
           fill = "lightblue", color = "black")


# Grouped Bar Plots ------------------------------------------------- 6:00

# To group bars together by a second variable, you will
# need to map a second variable to the fill argument,
# and you will also need to set the position argument
# to "dodge".

# Let's look at cabbage_exp
cabbage_exp

# The data frame has two categorical variables, Cultivar
# and Date, and a continuous variable, Weight. Let's
# create a bar plot where Weight is mapped to the y-axis,
# Date is mapped to the x-axis, and Cultivar is mapped
# to fill.

cabbage_exp %>%
  ggplot() +
  geom_col(aes(x = Date, y = Weight, fill = Cultivar),
           position = "dodge")

# You must specify position = "dodge" or else R will
# plot a stacked bar plot, which we will get to 
# later in the video.

# Any variable mapped to fill must be discrete.

# We can again add a black outline to the bars using
# the color argument. We may also change the colors 
# of the bars with either scale_fill_brewer() or
# scale_fill_manual(). Let's use the former, in
# which we map the string "Pastel1" to the 
# argument palette.

cabbage_exp %>%
  ggplot() +
  geom_col(aes(x = Date, y = Weight, fill = Cultivar),
           position = "dodge", color = "black") +
  scale_fill_brewer(palette = "Pastel1")

# Now, take a look at what happens next...

cabbage_exp[1:5,] %>%
  ggplot() +
  geom_col(aes(x = Date, y = Weight, fill = Cultivar),
           position = "dodge", color = "black") +
  scale_fill_brewer(palette = "Pastel1")

# If one of the bars is missing the data that which
# is mapped to fill, then that bar will occupy the 
# whole space like so.


# Bar Plot of Counts ------------------------------------------------ 10:00

# A bar plot of counts has one discrete variable
# mapped to the x-axis and nothing mapped to the
# y-axis. We also use geom_bar() in this instance.

diamonds %>%
  ggplot() +
  geom_bar(aes(x = cut))

# The diamonds data set has over 50,000 rows, each 
# representing information about a single diamond.

# We could also get this same plot using a group_by()
# then count().

diamonds %>%
  group_by(cut) %>%
  count()
  
# This code gives us a data frame of two variables and 5
# observations. One variable gives us cut, and the other
# variable, n, gives us the count of each variable.

diamonds %>%
  group_by(cut) %>%
  count() %>%
  ggplot() +
  geom_col(aes(x = cut, y = n))


# Colors in Bar Plots ------------------------------------------------ 14:00

# Like we saw before, we can use multiple colors to 
# show to different data in bar plots. If you want
# color to be associated with data, map the 
# appropriate viarbale to the fill argument.

# For this example, let's look at uspopchange, which
# looks at the percent change of population in each 
# U.S. state between 2000 and 2010. We will color
# the resulting bar plot by region.

# Let's first take the top 10 fastest growing 
# U.S. states. We can do this in two ways...

uspopchange %>%
  arrange(desc(Change)) %>%
  slice(1:10)

# or

uspopchange %>%
  arrange(desc(Change)) %>%
  top_n(10)

# Now we can color our bar plot by region

uspopchange %>%
  arrange(desc(Change)) %>%
  slice(1:10) %>%
  ggplot() +
  geom_col(aes(x = Abb, y = Change, fill = Region))

# We can again change the colors using
# scale_color_brewer() or scale_color_manual(). 
# Let's use _manual() and give the bars a 
# black outline (by setting color = "black").

# We will also use reorder() to order the bars
# in the plot by percent change rather than
# by the alphabetical of the states.

# We can also change the x label using xlab()

uspopchange %>%
  arrange(desc(Change)) %>%
  slice(1:10) %>%
  ggplot() +
  geom_col(aes(x = reorder(Abb, Change), 
               y = Change, 
               fill = Region),
           color = "black") +
  scale_fill_manual(values = c("#669933", "#FFCC66")) +
  xlab("State")

# We can also color bars differently based 
# on a positive or negative position. For this
# case, let's look at the climate data set.

climate

# Looking at a subset of the data (using filter),
# we will create a new variable (using mutate)
# that indicates whether or not our value of 
# interest is positive.

climate %>%
  filter(Source == "Berkeley" & Year > 1900) %>%
  mutate(pos = Anomaly10y >= 0)

# Now we can map color to positive and negative
# values. We must also set position = "identity".

climate %>%
  filter(Source == "Berkeley" & Year > 1900) %>%
  mutate(pos = Anomaly10y >= 0) %>% 
  ggplot() +
  geom_col(aes(x = Year, y = Anomaly10y, fill = pos),
           position = "identity")

# Two things we need to change: switching the colors
# and removing the redundant legend. We can do both
# in scale_fill_manual. We will also add a black 
# outline to each of the bars and set their size
# using size (in mm).

climate %>%
  filter(Source == "Berkeley" & Year > 1900) %>%
  mutate(pos = Anomaly10y >= 0) %>% 
  ggplot() +
  geom_col(aes(x = Year, y = Anomaly10y, fill = pos),
           position = "identity", color = "black",
           size = .25) +
  scale_fill_manual(values = c("#CCEEFF", "#FFDDDD"),
                    guide = FALSE)


# Adjusting Bar Width and Spacing ---------------------------------- 20:00

# To adjust the bar width, set the width argument
# in geom_col(). Default is 0.9

pg_mean %>%
  ggplot() +
  geom_col(aes(x = group, y = weight),
           width = 0.5)

# To adjust the spacing between grouped bars,
# set the value within position = position_dodge().

cabbage_exp %>%
  ggplot() +
  geom_col(aes(x = Date, y = Weight, fill = Cultivar),
           width = 0.5, position = position_dodge(0.7))


# Stacked Bar Plots ------------------------------------------------22:00

# All you need to do is just map a variable to fill.
# You don't need to specify the position argument.

cabbage_exp %>%
  ggplot() +
  geom_col(aes(x = Date, y = Weight, fill = Cultivar))

# There are three levels of Date and two levels of 
# Cultivar, meaning there are 6 combinations of the
# value for Weight. 

# If you want to reverse the stacking order of the
# data (and therefore the colors), do this:

cabbage_exp %>%
  ggplot() +
  geom_col(aes(x = Date, y = Weight, fill = Cultivar),
           position = position_stack(reverse = TRUE))

# To reverse the order of the legend to match the 
# reverse stacking, do this:

cabbage_exp %>%
  ggplot() +
  geom_col(aes(x = Date, y = Weight, fill = Cultivar),
           position = position_stack(reverse = TRUE)) +
  guides(fill = guide_legend(reverse = TRUE))

# Again, we can polish this plot by giving the
# bars a black outline and by changing the colors
# using scale_fill_brewer.

cabbage_exp %>%
  ggplot() +
  geom_col(aes(x = Date, y = Weight, fill = Cultivar),
           color = "black") +
  scale_fill_brewer(palette = "Pastel1")

# To make a proportional stacked bar graph, set
# the position argument to "fill"

cabbage_exp %>%
  ggplot() +
  geom_col(aes(x = Date, y = Weight, fill = Cultivar),
           color = "black", position = "fill") +
  scale_fill_brewer(palette = "Pastel1")

# If you want to change the labels on the y-axis
# to reflect percents, you can use the percent
# function from the scales package to do this.

cabbage_exp %>%
  ggplot() +
  geom_col(aes(x = Date, y = Weight, fill = Cultivar),
           color = "black", position = "fill") +
  scale_fill_brewer(palette = "Pastel1") +
  scale_y_continuous(labels = scales::percent)


# Labeling Bar Plots ---------------------------------------------- 26:00

# Use geom_text(), which requires an aesthetic mapping
# for the text itself. We set vjust to establish the
# verticle justification of the text, and set color to
# to give the text color.

# geom_text() also requires an x and y mapping, and because
# of that we need to put the aes inside ggplot() call.
# However, I don't like putting in aes inside ggplot(),
# and I usually don't like using geom_text() whenever I 
# want to add text to a plot. But I'm doing this just to
# show you that this is possible.

pg_mean %>%
  ggplot(aes(x = group, y = weight)) +
  geom_col() +
  geom_text(aes(label = weight), vjust = 1.5, 
            color = "white")

pg_mean %>%
  ggplot(aes(x = group, y = weight)) +
  geom_col() +
  geom_text(aes(label = weight), vjust = -.2, 
            color = "black")

# You'll probably notice that one of the labels
# is cut off. We can add more space by increasing
# the limit of the y-axis, either through ylim()
# or through scale_y_continuous.

pg_mean %>%
  ggplot(aes(x = group, y = weight)) +
  geom_col() +
  ylim(c(0,6)) +
  geom_text(aes(label = weight), vjust = -.2, 
            color = "black")

pg_mean %>%
  ggplot(aes(x = group, y = weight)) +
  geom_col() +
  scale_y_continuous(limits = c(0,6)) +
  geom_text(aes(label = weight), vjust = -.2, 
            color = "black")

# To label a bar plot of counts, we'll need to
# use geom_bar()

mtcars %>%
  ggplot(aes(x = as.factor(cyl))) +
  geom_bar() +
  geom_text(aes(label = ..count..),
            stat = "count", vjust = 1.5, colour = "white")

# Personally, I don't like the look of numbers at the 
# top of bars in bar plots. When we get to the annotations
# video later, I will show you better ways to include labels
# in plots.

# Ok that's it for this video.










