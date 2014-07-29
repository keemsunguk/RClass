## Programming Assignment 2
## Cache the inverse matrix


## Assign matrix in an environment that is different from the current environment
## Define the methods of both set and setInverse into cache 
## Define the methods of both get and getInverse from cache
## Put in the list of methods under x so x becomes cacheable
makeCacheMatrix <- function(x = matrix()) {
     m <- NULL
     set <- function(y) {
          x <<- y
          m <<- NULL
     }
     get <- function() x
     setInverse <- function(matrix) m <<- matrix
     getInverse <- function() m
     list(set = set, get = get,
          setInverse = setInverse,
          getInverse = getInverse)
}


## Return inverse if exist in the cache
## Or compute inverse and cache it 
## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, b, ...) {
     m <- x$getInverse()
     if(!is.null(m)) {
          message("getting cached inverse matrix")
          return(m)
     }
     data <- x$get()
     m <- solve(data, b, ...)
     x$setInverse(m)
     m
}
