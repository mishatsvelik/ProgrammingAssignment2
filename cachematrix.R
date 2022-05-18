## Functions to:
#1.set the value of the matrix
#2.get the value of the matrix
#3.set the value of the inverse
#4.get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
#If the inverse has already been calculated (and the matrix has not changed),
#the cachesolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  comment out the below 3 lines to test and prove that this function 
  caches a previously solved matrix
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

# ##Testing
# test <- matrix(c(1,2,2,1), 2, 2)
# test <- matrix(c(1,3,3,1), 2, 2)
# x <- makeCacheMatrix(x = test)
# print(cacheSolve(x))
