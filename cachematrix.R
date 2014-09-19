## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    ##By defualt, nothing is cached when the object is first created
    inverse <- NULL
    
    ## Accessor and mutator functions for matrix value and cached inverse
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setinverse <- function(i) inverse <<- i
    getinverse <- function() inverse
    
    ## Return the list of accessors and mutators for this object
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
