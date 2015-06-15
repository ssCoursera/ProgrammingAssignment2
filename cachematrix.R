## cachematrix caches potentially time-consuming computation of 
##    matrix inversion. In particular two functions are used to create
##    a special object that stores a numeric matrix and caches its 
##    inverse.

## This function creates a special "matrix" object
##    that can cache its inverse.

makeCacheMatrix <- function(M = matrix()) {
            Minv <- NULL
            set <- function(A) {
                    M <<- A
                    Minv <<- NULL
            }
            get <- function() M
            setinv <- function(inv) Minv <<- inv
            getinv <- function() Minv
            list(set = set, get = get,
                 setinv = setinv,
                 getinv = getinv)
}

## This function computes the inverse of the special
##    "matrix" returned by `makeCacheMatrix` above. If the inverse has
##    already been calculated (and the matrix has not changed), then
##    `cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(A, ...) {
        ## Return a matrix that is the inverse of 'A'
            Minv <- A$getinv()
            if(!is.null(Minv)) {
                    message("getting cached data")
                    return(Minv)
            }
            data <- A$get()
            Minv <- solve(data, ...)
            A$setinv(Minv)
            Minv
    }
	

