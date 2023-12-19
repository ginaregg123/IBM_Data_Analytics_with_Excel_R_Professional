printHelloWorld <- function(){
  print("Hello World")
}

#  add function
add <- function(x, y) {
  x + y
}

# Using IF/ELSE statements in functions
isGoodRating <- function(rating){
  #This function returns "NO" if the input value is less than 7. Otherwise it returns "YES".
  
  if(rating < 7){
    return("NO") # return NO if the movie rating is less than 7
    
  }else{
    return("YES") # otherwise return YES
  }
}

# Setting default argument values in your custom functions
# Update the isGoodRating by using a default threshold value 7

isGoodRating <- function(rating, threshold = 7){
  if(rating < threshold){
    return("NO") # return NO if the movie rating is less than the threshold
  }else{
    return("YES") # otherwise return YES
  }
}

# Coding Practice: Write a is bad rating function to print YES if rating is under 5 and print NO if rating is above 5
# Write your code below. Don't forget to press Shift+Enter to execute the cell
isBadRating <- function(rating, threshold = 5){
  if(rating > threshold){
    return("NO") # return NO if the movie rating is larger than the threshold
  }else{
    return("YES") # otherwise return YES
  }
}

# Using functions within functions

my_data <- read.csv("movies-db.csv")
head(my_data)

watchMovie <- function(data, moviename){
  rating <- data[data["name"] == moviename,"average_rating"]
  return(isGoodRating(rating))
}

#  update the watchMovie function to print the movie name and actual rating
watchMovie <- function(moviename, my_threshold = 7){
  rating <- my_data[my_data[,1] == moviename,"average_rating"]
  
  memo <- paste("The movie rating for", moviename, "is", rating)
  print(memo)
  
  return(isGoodRating(rating, threshold = my_threshold))
}

# Coding Exercise: update the watchMovie function to use the mean rating of all movies as the threshold
watchMovie <- function(moviename, my_threshold = 7){
  rating <- my_data[my_data[,1] == moviename,"average_rating"]
  # Get mean rating
  print(my_data$average_rating)
  mean_threshold <- mean(my_data$average_rating)
  print(mean_threshold)
  memo <- paste("The movie rating for", moviename, "is", rating)
  print(memo)
  
  return(isGoodRating(rating, threshold = mean_threshold))
}

# Global and local variables

# memo returns
watchMovie <- function(moviename, my_threshold = 7){
  rating <- my_data[my_data[,1] == moviename,"average_rating"]
  
  memo <- paste("The movie rating for", moviename, "is", rating)
  print(memo)
  
  isGoodRating(rating, threshold = my_threshold)
}

# example of a global variable assignment
myFunction <- function(){
  y <<- 3.14
  return("Hello World")
}