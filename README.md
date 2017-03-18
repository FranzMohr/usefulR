# usefulR
Some functions I find useful.

## panel2ts
panel2ts(data,id=NULL,vars=NULL) transforms a panel data set into a data frame with the time in the first column and the series of each entity as additional columns.
data is a data frame with panel data, e.g. id, time, varible 1, variable 2, etc.
id is a character vector of length 2 with the name of the entity and time column, respectively. If NULL the function assumes that the first two columns of the data set are the identity and time variables.
vars is a character vector containing the column names of those variable that should be used. If NULL all columns are used except the those that are specified in id.
