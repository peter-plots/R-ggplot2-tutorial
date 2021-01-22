
# Getting to Know RStudio -------------------------------------------------

# When starting up RStudio, you will be greeted with a 
# layout similar to what you see on my screen
# 
# !Describe the script, consol, global environment,
# and (files, plots, packages, etc.) panes!
# - Start with the what the script pane is for
# - Then talk about how that is different from console
# - Talk about global environment, and then the files, etc.

# The most important concept of knowing how to do 
# anything in R is that of functions and objects
# 
# Functions perform various mathematical, statistical,
# algorithmic and computational operations. They take 
# arguments that transform values into various output.
# 
# The output of functions can be stored in what are known
# as objects. Also, singular values may also be stored in
# objects

# The first type of functions I will introduce are the 
# arithmetic type of functions that you find on a computer 

3+4
5-7
4*7
20/5

# Those were the addition, subtraction, multiplication
# and division operators. Notice how when that there are 
# two ways to run the function, or run the code:
#   1. You can either press "Run" up here
#   2. Or you can press command/ctrl + enter on Mac/PC
#   
# In order for the specific code that you want to run, you
# must make sure your curser is on the line of your 
# desired code. If your code takes up multiple lines, then
# the curser can be on any of the lines that the code 
# takes up.

# Another thing you should notice is that after you run
# your code, its output gets printed down below in 
# the console. 

# You can also write and run code in the console like 
# so, but code will only be saved if it is
# written in the script pane.

# Now, the function output was printed in the console
# because we did not store that output in an object. 

# That piece of code is just floating on the script, 
# and every time you want that specific output you 
# would need to run that whole line of code again. 
# 
# The reason we store function output in objects is 
# because that makes it easier to retrieve that output, 
# which is very important especially in data science. 
# 
# Even though these first few arithmetic functions
# produced singular values as output, you will quickly
# see its value.

# Say I want to create combine a couple of numbers 
# together into what is known as a vector, and I want
# to reuse or modify this vector of numbers again and 
# again. 

c(1, 2, 3, 4)

# The concatenate function "c()" combines numbers together
# into what are officially known as atomic vectors. 
# 
# If I want to call for the function to concatenate the
# numbers 1, 2, 3 and 4 again, I would either have to 
# rewrite c(1, 2, 3, 4) each time, or...

a <- c(1, 2, 3, 4)

# I have now stored the function output or the function
# call in an object that named "a"

a

# Calling "a" returns the function call that's stored 
# in it. Let's see what happens when we do some simple
# arithmetic with "a".

a+4
a-5
a*2
a/5
a**2

# The double star means "to the power of", so just like
# a caret indicating exponent. 

# Any function that I apply to the vector "a" gets 
# applied to each value in the vector. 

# This is another important aspect you must 
# understand. Data frames, which are the central data
# component we'll be dealing with, are essentially 
# combinations of vectors that act the same way as 
# above.

# Now, we can call some functions that take all of the 
# values in the vector and return just one value instead
# of four values.

mean(a)
median(a)
sum(a)
min(a)
max(a)
range(a)


"Hello"

hello <- "Hello"
hello

# Now, let’s focus the most important type of object you’ll be working
# with when creating dataviz, and that is the data frame.

# The technical definition for a data frame is: a table or a two-dimensional 
# array-like structure in which each column contains values of one variable and 
# each row contains one set of values from each column.

# I got that definition from https://www.tutorialspoint.com/r/r_data_frames.htm.
# Basically, a data frame is a neat way of organizing data so that information 
# can be extracted in a simpler way.

# In this video I will create a hypothetical data frame from 
# scratch just to show you the basics of how to work with them.

# In the next video, I will cover how to import outside data
# as well as wrangle them into your desired shape.

# So, let’s pretend we have data on a summer basketball league
# for high-school age boys who come from different schools. Let’s create a
# data frame that contains data about two teams that are matched up 
# for a particular game.

# The first column we'll create is for the players available for the game.
# Since each team in my made up league can have 8 players available for the
# game, we'll create a vector with 16 names.

players <- c("Justin", "Aaron", "Derek", "Chris", "Matt", "David", "Joaquin", "Will",
             "Drew", "Eric", "Michael", "Cameron", "Alex", "Terry", "Garrett", "Patrick")

# Next, we need a vector for the team names to show which team each player is on.
# We'll be simple and say that the first eight names are on team 1 and the 
# second eight names are on team 2.

teams <- c("team1", "team1", "team1", "team1", "team1", "team1", "team1", "team1", 
           "team2", "team2", "team2", "team2", "team2", "team2", "team2", "team2")

# Ramdonly sampling ages
age <- sample(14:18, 16, replace = TRUE)  

# Randomly sampling heights
hun <- seq(from = 5.5, to = 6.75, by = .01)
height <- sample(hun, size = 16, replace = T)

# Defining their schools
school <- c("North", "North", "South", "North", "South", "East", "South", "East",
            "East", "East", "East", "South", "South", "East", "South", "East")

# DOB
dob <- c(20030514, 20041018, 20031212, 20040920, 20030804, 20030708, 20050924, 20060129,
         20040120, 20040229, 20020618, 20051014, 20051127, 20030301, 20030205, 20030819)

# And now we can put it all together in a data frame

mydf <- data.frame(players, teams, age, height, school, dob)

View(mydf)

# So with this data frame,
