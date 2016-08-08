## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix ,this function creates a special "matrix" object that can cache its inverse.

i <- NULL begins by setting the mean to NULL as a placeholder for a future value

set <- function(y) {x <<- y; i <<- NULL} defines a function to set the vector, x, to a new vector, y

get <- function() x returns the vector, x

setinverse <- function(inverse) i <<- inverse sets the inverse, i, to inverse

getinverse<- function() m returns the mean, m

list(set = set, get = get,setinverse = setinverse, getinverse= getinverse) returns the 'special vector' containing all of the functions just defined

makeCacheMatrix <- function(x = matrix()) {
i <- NULL
set <- function(y) {
x <<- y
i <<- NULL
}
get <- function() x
setinverse <- function(inverse) i <<- inverse
getinverse <- function() i
list(
set = set,
get = get,
setinverse = setinverse,
getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 

If the cached inverse is available, cacheSolve retrieves it, and if not, it computes, caches, and returns it. thats the gist of this.

If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {

## Return a matrix that is the inverse of 'x'

i <- x$getinverse()
if(!is.null(i)) {
message("getting cached data")
return(i)
}
data <- x$get()
i <- solve(data, ...)
x$setinverse(i)
i
}


