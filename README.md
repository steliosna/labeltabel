# Install Package
install.packages("remotes")  
remotes::install_github("steliosna/paulitable")  


# What does the function do?

paulitable(dataframe, stats = FALSE, missings = FALSE)

dataframe: The Dataframe you want to use  
stats: Set to TRUE if you want mean & range for numeric variables  
missings: Set to TRUE if you want missing-percentages for variables  
