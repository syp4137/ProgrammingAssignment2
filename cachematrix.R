## I create a special matrix object by using makeCacheMatrix() function,
## then, I use cahceSolve() function to get the inverse of that matrix.

## makeCacheMatrix : creates a special matrix object that can cache its inverse matrix
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    
    get <- function() x
    
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## cacheSolve: computes the inverse or retrieves it from cache

cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
    if(!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(dasta, ...)
    x$setinverse(inv)
    inv
}