panel2ts <- function(data,id=NULL,vars=NULL){
  require(reshape2)
  # Specify entity and time series variables
  if (is.null(id)){
    id <- names(data)[1:2]
    warning("No id variables provided. First to columns in data are used.")
  }
  
  # Specify which variables form the panel data set should be used
  if (is.null(vars)){
    vars <- names(data)[-which(is.element(names(data),id))]
  }
  data <- data[,c(id,vars)] # Reduce data to necessary amount
  
  # Check for duplicated values and stop if there are some
  if (any(duplicated(data[,1:2]))){
    stop(paste("Duplicates found in row(s) ",
               paste(which(duplicated(data[,1:2])),collapse=",")
               ,".",sep="")
    )
  }
  
  # Turn panel data into time series
  data <- melt(data,id.vars=id)
  data <- dcast(data,as.formula(paste(paste(id[2],id[1],sep="~"),"+variable",sep="")),value.var="value")
  return(data)
}
