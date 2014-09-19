## The functions in this project, makeCacheMatrix and cacheSolve, implement a
## cachable object model of matrices which can calcualte the inverse of the 
## matrix and cache it for future use without the need to perform the 
## calculation again every time the inverse is needed


## makeCacheMatrix takes a matrix as an argument and returns a cachable matrix
## object in the form of a list of its accessor and mutator functions
## Parameters:
##    x - A matrix object to be made cachable
## Result: A cachable matrix object (list of functions): set, get, setinverse,
## getinverse.
makeCacheMatrix <- function(x = matrix()) {
    
    ##By defualt, nothing is cached when the object is first created
    inverse <- NULL
    
    ## Accessor and mutator functions for matrix value and cached inverse
    set <- function(y) {
        x <<- y
        ##Setting a new matrix means we don't know what the inverse is anymore
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


## the cacheSolve function implements a cached version of the solve() function
## for this object. It checks whether the inverse of the matrix is already in
## the cache, and returns the cached version if it is found or calculates the
## inverse and caches it if the cache was empty
## Parameters:
##    x -   A cachable matrix object
##    ... - additional arguments passed to solve()
## Result: the inverse of the matrix passed to the function
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    inverse <- x$getinverse()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    ## No cached inverse. Calculate and cache the inverse
    data <- x$get()
    inverse <- solve(data, ...)
    x$setinverse(inverse)
    inverse
}
