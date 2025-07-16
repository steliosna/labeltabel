# What is paulitable?
A function to show the variable names and the corresponding variable labels, inspired by the  Variable-Window in Stata.

# Install Package
install.packages("remotes")  
remotes::install_github("steliosna/paulitable")  


# Function Structure

paulitable(dataframe, stats = FALSE, missings = FALSE)

dataframe: The Dataframe you want to use  
stats: Set to TRUE if you want mean & range for numeric variables  
missings: Set to TRUE if you want missing-percentages for variables  
