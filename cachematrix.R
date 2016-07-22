## We have two functions that are used to create a special vector that stores a numeric vector and cache’s its mean

## makeCacheMatrix creates a list containing a function to
## 1.- set the value of the matrix
## 2.- get the value of the matrix
## 3.- set the value of inverse of the matrix
## 4. get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
     inv <- NULL
     set <- function(y) {
         x <<- y
         inv <<- NULL
     }
     get <- function() x
     setinverse <- function(inverse) inv <<- inverse
     getinverse <- function() inv
     list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
 }
x = rbind(c(1, 3/8), c(3/8, 1))
m = makeCacheMatrix(x)
m$get()

## Cache function returns the mean of the especial vector cretaed by makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
inv <- x$getinverse()
     if(!is.null(inv)) {
         message("getting cached data.")
         return(inv)
     }
     data <- x$get()
     inv <- solve(data)
     x$setinverse(inv)
     inv

}
cacheSolve(m)
