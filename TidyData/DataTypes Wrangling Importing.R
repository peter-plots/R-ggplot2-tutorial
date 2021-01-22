
# So I apologize for not including this in the 
# previous video, but we're gonna want to add two 
# more variables to our data frame

games_played <- sample(6:8, 16, replace = T)
total_points <- sample(10:90, 16, replace = T)

# We can add them to our data frame using cbind()

df <- cbind(mydf, games_played, total_points)

# Identifying Data Types --------------------------------------------------------------

# So we left of the last video with creating a data 
# frame, which is the most important object that we 
# will deal with when creating dataviz.
# 
# A data frame is a combination of vectors each of the
# same length, but the vectors do not have to be of
# the same type
# 
# If we look at the data we created (mydf), which
# still resides in our global environment, we can
# click on the arrow next to it to get a glimpse of
# the structure of the data.

# We can also obtain this view with the following
# code

str(mydf)

# So the first thing we notice is that this 
# data frame has 16 observations and 6 variables.

# The six variables are then listed below, 
# starting with their name, then their data
# type, and then as many observations as can
# fit on the screen.

# This is the important step of inspecting our
# data to make sure that the data types of all 
# of our columns/variables are correct. 

# The first variable is players, and it is a
# character vector. Remember when we created the
# vector, we created a vector of character strings
# that contained the names of each of the players
# available for our hypothetical basketball game.
# This is the correct data type for this variable.

# The second variable is teams, and it is also a
# character vector. Now, we did indeed create a 
# vector of character strings for the teams
# variable. However, it would be incorrect to 
# leave this variable as a character, for they do
# not have any informational value besides naming
# and identification. 

# We can't perform statistical operations on 
# character vectors, and we need to for the teams
# vector since we wil need to be able to group the 
# data by team. So in order to be able to do that
# we will change the data type of the teams 
# variable to that of a factor.

# A factor is a data type that represents 
# categorical or discrete variables. They are 
# variables in which there is fixed number of values,
# known as levels, that the variable can take. 
# In our data, there are only two values that 
# the teams variable can take: team1 and team2.

# If we were to expand this data set to include 
# all the players on every team in this particular
# league, then the number of levels will increase.
# But for right now, teams can only have 2 values.

# To change the data type of teams to type factor,
# use the following code:

df$teams <- as.factor(mydf$teams)

# The third and fourth variables, age and height,
# are integer and numeric variables, respectively.
# They both refer to continuous variables, which
# are variables that can take any number within a
# defined range. There is not a fixed set of values.

# Integer vectors refer to continuous variables
# that are whole numbers, while numeric variables
# refer to continuous variables that are any real
# number (just think of them as having decimal
# points). 

# You might be wondering why age is not a factor,
# since there are only 5 values that that variable
# can take: 14, 15, 16, 17, 18. Consider that
# several boys at age 16 could all be at different
# parts of their 17th year on Earth. One may be 
# 16 and 2 mos, one is 16 and 6 mos, and one is 
# going to turn 17 next week. 

# Age and height can remain as they are.

# The fifth variable is school. Just like teams,
# we need to change school to a factor.

df$school <- as.factor(mydf$school)

# And finally we have dob, which is currently
# stored as a numeric variable but obviously 
# that's not how we interpret dates. Date variables
# have a special type of their own, date type.

# First off, you may notice that they are
# represented in scientific notation. To change
# that, just command the following code.

options(scipen = 999)

# Next, we must change the dob to a character
# before it can be changed to a date type.

df$dob <- as.character(mydf$dob)

# Third, we can now change the dob to a date
# type using the following code.

df$dob <- as.Date(mydf$dob, "%Y%m%d")

# The string after the comma satisfies the 
# format argument of the as.Date function. You 
# must recognize how the numbers of the date
# are stored in the character string and then 
# tell R what format that is in order for R to
# conver it to a date. So, because our dob 
# strings started with the four digit year, then
# two digit month, then two digit day, without
# any delimitors, I wrote the format string that
# particular way. 

# Here's a table that shows you each of the 
# strings that the format argument will take. It 
# would be helpful if you too a screenshot of this
# and stored it in your project fold.

# Now that we have all of our variables in the correct
# data type, we can now look at an accurate summary 
# of our data frame using summary()

summary(mydf)

# Extracting Data ---------------------------------------------------------

# Now that we know some data types, now let's talk
# about extract information from our data set. 
# Let's ignore the fact that we manually created
# our data frame and already have the indidivual
# vector objects at our disposal and pretend 
# that we got this data frame from somewhere else.


# We have our data frame, mydf, and say we want to 
# extract just the second column, teams, from mydf.
# There are two ways to do that. The first method I'm
# gonna show you is called indexing

# So one thing that makes data frames special is that
# not only do are they a matrix like table of vectors
# and data, but they also have an index component to them.
# Each of their rows and columns are numbered, and we
# can use the numeric positions of rows and columns to
# extract particular pieces of information. 

# Let's say I wanted just the first row in mydf, which
# would be all of the inforomation pertaining to Justin.
# To get that via indexing, I would run the following
# code:

mydf[1,]

# If I wanted the just the first column in mydf, which
# would be all of the values in the players column, I 
# would this:

mydf[,1]

# And if I just wanted the value in the first row and
# the first column, I would do this:

mydf[1,1]

# Indexing means that in a data frame, values occupy 
# positions of the ith row and jth column. Every time
# you index, you must specify which value is i and which
# value is j, which means you must always use a comma
# to separate rows and columns, even if you are selecting
# an entire row or column.

# Now let's say you wanted multiple rows and all columns.
# If the rows are consecutive, like the 4th, 5th, and
# 6th row, you can do something like this:

mydf[4:6,]
# look familiar?

# Same thing with columns:

mydf[,2:4]

# And both at the same time

mydf[4:6, 2:4]

# By the way, each of these operations returns a new
# data frame:

c <- mydf[4:6, 2:4]
str(c)

# In order to extract non-consecutive rows or columns,
# just use the c() function.

mydf[c(1, 3, 6, 7), c(1, 3, 6)]

# Now, indexing can be useful if you know the index of
# each row and column. However, once you start to work 
# with data frames with 100's-1000's of rows and 10's-
# 100's of columns (like those in the real world), 
# indexing becomes impractical. 

# So, a better way of extracting singular columns is to
# use the $ operator.

mydf$players
mydf$teams

# But what about extracting rows? There's a very useful
# and powerful data wrangling package called dplyr. It
# is a part of the tidyverse, of which ggplot2 also
# belongs to. It has functions that are better suited
# for the kind of workflow that we want.

# To download dplyr, first command
# install.packages("dyplr")

# Then...
library(dplyr)

# Now, before I get into the functions we'll be using
# in dplyr, I want to introduce to you the piping 
# operator that comes with dplyr: 
# %>% (Command + Shift + M)

# The %>% offers a more intuative way of using functions
# when writing code. Take the mean function. We can 
# either do this:

mean(mydf$height)

# Or, we could turn it inside out using %>% 

mydf$height %>%
  mean()

# This essentially reads, take mydf$height, and pipe it
# through the mean() function.

# It works for str(), summary(), and view() as well.

mydf %>% 
  str()

mydf %>%
  summary()

mydf %>% 
  View()

# Using View() will be very useful especially after
# using %>% a couple of times in one piece of code. From
# now on, we will be using %>% as often as possible.

# Coming back to dplyr...
# There are two main functions that replace extracting
# rows and columns via indexing: select() and filter().

# select() returns specified columns:

mydf %>%
  select(teams)

mydf %>% 
  select(players, height)

# Which one looks more intuitive? Exactly. You can select
# as many columns as you'd like, separating them by
# commas. This operation also returns a data frame that
# which can be stored in a new object. 

# If you want to select all columns BUT leave some out,
# just add a - or ! before the column(s) you want to 
# leave out:

mydf %>%
  select(-dob)

mydf %>%
  select(!c(dob, age))

# In order extract rows that follow a certain criteria,
# use the filter() function.

mydf %>%
  filter(age >= 17)

# You'll need to know how to how different relational
# and logical operators work in R, so here are a couple.
# The last one was greater than or equal to.

# Less than or equal to
mydf %>%
  filter(age <= 17)

# Equal to
mydf %>%
  filter(age == 17)

# Not equal to
mydf %>%
  filter(age != 17)
# As you might have guessed, the ! means NOT, so putting
# it before something means NOT something

# Logical operators:

# AND
mydf %>%
  filter(age < 17 & height > 6)

# OR
mydf %>%
  filter(age < 17 | height > 6)

# For strings ands factors:

mydf %>%
  filter(teams == "team1")

# The %in% operator is a way shortening OR 
# statements.

mydf %>%
  filter(school == "North" | school == "South")

# This is much faster and clearer

mydf %>%
  filter(school %in% c("North", "South"))


# Manipulating Data -------------------------------------------------------

# The next function I want to introduce to you deals with
# manipulating data that is already present in the
# data frame, and that is the mutate() function.

# mutate() will create a new column based off of an
# arithmetic operation of vectors that are already 
# in the data frame.

# We have two new variables, games_played and total_points,
# that have been recorded throughout the season. Let's 
# say we want to know how many points each player is 
# averaging per game. We use mutate() to get that answer.

mydf %>%
  mutate(ppg = total_points / games_played) %>%
  View()

# How this reads is that after calling mutate(), we
# supply it with the name of the new column we're
# creating, then we set it equal to the operation that
# produces what we want: the total number of points 
# scored by each player divided by the number of games
# they have played. 

# However, this column has not been appeneded to mydf. 
# It only exists in this code. In order for the column
# to be actually created, we must assign this function
# call to another object.

df2 <- mydf %>%
  mutate(ppg = total_points / games_played)

mydf2$ppg

# So mutate is going to be a very useful function in the
# future.

# Now, the next set of functions are best explained via
# questions about how to extract certain information.

# Counting ----------------------------------------------------------------

# The next important function from dplyr that we need
# to know is count().

# How many players attend each school?

mydf2 %>%
  count(school)

# How many players of each age?
mydf2 %>%
  count(age)

# How many players based on each team attend each school?
mydf2 %>%
  count(teams, school)

# Again, like before, each of these function calls 
# produces a new data frame that can be stored in their
# own object.


# Grouping and Summarizing ------------------------------------------------

# The next couple of functions we're gonna look at 
# are group_by() and summarize()

# What is the average ppg for players that attend each
# of the high schools?

mydf2 %>%
  group_by(school) %>%
  summarise(mean_ppg = mean(ppg))

# What is the maximum height of the players on each team?

mydf %>% 
  group_by(teams) %>%
  summarize(max_height = max(height))

# What is the standard deviation of points scored of the 
# players that go to each school?

mydf2 %>%
  group_by(school) %>%
  summarize(var_points = sd(total_points))

# What is the ppg scored by players of each age?

mydf2 %>%
  group_by(age) %>%
  summarize(age_ppg = mean(ppg))


# Average height of players at each age?

mydf2 %>%
  group_by(age) %>%
  summarize(height_age = mean(height))


# Sorting -----------------------------------------------------------------

# The last function we'll talk about from dplyr is the
# arrange() function. It rearranges data based on a 
# particular value or variable.

# Let's say we want to arrange our data frame by height.

mydf2 %>%
  arrange(height) %>%
  View()

# What about by age descending?

mydf2 %>%
  arrange(desc(age)) %>%
  View()

# The important thing to note about the arrange function
# is that is changes the index to fit however you 
# specified the sorting order of the data frame.

mydf3 <- mydf2 %>%
  arrange(desc(ppg))

mydf3 %>%
  View()


# Uniting and Separating --------------------------------------------------

# The next thing we're going to talk about are functions
# that come from the tidyr package, also a part of the
# tidyverse family.

library(tidyr)

# We will look at separate() and unite().

# Looking at our dob variable, let's say we want to 
# split that up into year, month, and date. We will
# use the separate function.

mydf2 %>%
  separate(dob, c("year", "month", "day"), sep = "-")

# What happened was that I piped mydf2 into the separate
# function and told R I want to separate the dob variable.
# I then said that I want three new columns, called "year",
# "month", and "day" to be created by this separation,
# and then I specified on which character I want R to
# separate the variable, which is the "-".

# Again, like with mutate, we must assign this function
# call to another object in order for us to access these
# new variables.

df4 <- mydf2 %>%
  separate(dob, c("year", "month", "day"), sep = "-")

# Now, these came out as character vectors; we must change
# them to numeric vectors.

mydf4$year <- as.numeric(mydf4$year)
mydf4$month <- as.numeric(mydf4$month)
mydf4$day <- as.numeric(mydf4$day)

# Year and day are fine, but what if we want to actually
# see the ,onth name and not the number? We can change
# month to an ordered factor (because months have
# an order):

mydf4$month <- as.ordered(mydf4$month)

# And then use recode_factor from dplyr to change
# the values to the right names:

mydf4$month <- recode_factor(mydf4$month, 
                             "1" = "Jan",
                             "2" = "Feb",
                             "3" = "Mar",
                             "4" = "Apr",
                             "5" = "May",
                             "6" = "Jun",
                             "7" = "Jul",
                             "8" = "Aug",
                             "9" = "Sep",
                             "10" = "Oct",
                             "11" = "Nov",
                             "12" = "Dec")
              
# Now, this is a very tedious way of changing the levels
# of a factor. Looking at the dob vector individually, 
# we can see how we can change date vectors to different
# formats.

format(as.Date(mydf3$dob), format = "%B %d, %Y")

# We can assign this vector to mydf3$dob and change its 
# date format thusly.

mydf3$dob <- format(as.Date(mydf3$dob), 
                    format = "%B %d, %Y")

# It should be noted that this function changed mydf$dob 
# to a character vector, so we must change it again
# to a date vector. Remember its format!!

mydf3$dob <- as.Date(mydf3$dob, "%B %d, %Y")

# Now the date format is back to %Y-%m-%d. You'll
# just have to deal with how R prefers its dates.

# Let's say we decide that we don't care about having 
# month, day, and year separated, and we want them
# back to being contained in one variable.

# What we can do is use the unite function to unite
# them back together using the following code:

mydf5 <- mydf4 %>%
  unite("dob", year, month, day, sep = "-")


# Importing and Cleaning Data ---------------------------------------------

# The last portion of this video will be dovoted to
# importing and cleaning data (sorta). Again,
# these videos aren't going to teach you data
# science like you would learn at university,
# I'm just giving you the practical knowledge you
# need in order to participate in this forum that
# I'm trying to create.

# So importing is definitely important, and I'll 
# explain everything you need to know about importing
# .csv and .xlsx files, which are the files you'll
# most likely be dealing with.

# I probably won't make any videos about webscraping
# mainly because I don't know HTML at all and there
# are so many other YouTube videos out there that
# explain it much better than I ever could.

# With data cleaning, however, I'm just gonna teach
# you two different functions that compliment each 
# other that are from the tidyr package. They are
# important in getting your data in the right
# shape, so I'm kinda confused as to why they're 
# not in dplyr, but I'm not the one developing
# that software. But that's why I'm saying
# cleaning (sorta). I may make a video in
# the future over everything in tidyr, but
# I'm primarily focused on getting you all
# to create dataviz.

# So with importing data, the two main types of files
# you'll be dealing with are .csv, which stand
# for comma separated values, and .xlsx, which are
# Excel Spreadsheets. There are also tab separated
# values (tsv) as well as others, but I've primarily
# only encountered .csv, which are the preferred
# format for storing data. 

# If you don't own Excel and use Google Sheets
# for your spreadsheet needs, you have the option 
# of downloading data as a .csv.

# I'm gonna be showing you how to how to import
# data from both a .csv file and an .xlsx file.

# The .csv file can be found at the following link: 
# https://www.kaggle.com/shivamb/netflix-shows. 
# It's a file containing data about all Netflix
# shows and movies.

# Make sure to download the .csv file in your
# project folder.

# We will use the read.csv function from the
# readr package, also a part of the tidyverse

library(readr)

netdf <- read.csv("netflix_titles.csv")

# We won't touch this data just yet, so don't
# delete it from your Project folder!

# Next, we'll go to this website:
"https://www.bts.gov/content/us-energy-consumption-transportation-sector"
# to download an .xlsx file. It's contains data 
# about transportation fuel consumption broken
# down by energy source.

# We need the read.xlsx function the read_xlsx
# library

library(readxl)

dotdf <- read_excel("table_04_04_111020.xlsx")

# Let's view dotdf

dotdf %>% View()

# Our data frame is kinda dirty (as per usual when
# downloading data from goverment websites). It appears
# the column names are a result of there being a title
# in the cell before the actual table in the 
# excel file. 

# If we look at the data preview on the bts website,
# we can see that years are supposed to be the column
# headers. Right now they are occupying the first row, 
# so we need to change that.

# We can use the row_to_names function from the janitor
# package.
install.packages("janitor")
library(janitor)

# Now, before we do this, let's give
dotdf[1,1]
# Which is currently missing. How about..
dotdf[1,1] <- "transpo_egy_bkdn"

# This will give us less trouble when we run
# the following command:

dotdf2 <- dotdf %>%
  row_to_names(row_number = 1)

dotdf2[,1 ]

# Ok, so you might think we're done processing
# this data frame since the variable names 
# seem reasonable. However, you should never
# store any data relating to time as distinct
# variables — they all need to be in the 
# same column. 

# When we get to line graphs, you'll see why
# what where about to do is important.

# So, in order to get the columns 1960 to
# 2019 down into one column, we're going to
# use the pivot_longer function from tidyr.

# What we are doing is we are changing our
# data from a wide format to a long format, 
# condensing our numerous columns into two:
# one with names that were previously the 
# title of the columns, and one for the values
# in each column.

# Let's try it out

dotdf3 <- dotdf2 %>%
  pivot_longer(`1960`:`2019`,
               names_to = "year",
               values_to = "quad_btu")

# Interesting, the values in column 1980 onward 
# are all in character vectors, weird.

# Ok so in order to change multiple the data
# types of multiple variables at once, do the
# following:

# I'm taking the columns currently of data type character,
# changing them to type numeric using the sapply function,
# coercing the resulting output into a data frame, and the
# storing the data frame in dotdf3.
dotdf3 <- as.data.frame(sapply(dotdf2[,6:37], as.numeric))

# Next, I take the columns in dotdf3 and combine them with
# the first five columns in dotdf2 using the cbind function,
# and then storing the resulting data frame in dotdf4.
dotdf4 <- cbind(dotdf2[,1:5], dotdf3)

# Now we can use the pivot_longer function, 
# which takes three arguments (after piping
# in the data frame):
# the columns you want to collapse,
# the name of the new column for the column names,
# and the name of the new column for their values.

# And then I store it in dotdf5
dotdf5 <- dotdf4 %>%
  pivot_longer(2:37,
               names_to = "year",
               values_to = "quad_btu")


dotdf5 %>%
  View()

# It may seem redundant to repeat the row names over
# and over again for each year, but trust me
# it will allow us to properly plot a line chart
# when we eventually get there.

# So, you can image what pivot_wider does,
# changes your data from long to wide. I can't 
# really think of a reason why this is necessary
# for our purposes in dataviz, so I'm not gonna 
# show you how it works.
