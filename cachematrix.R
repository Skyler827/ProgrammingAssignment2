## cachematrix.R - Programming assignment 2 by Skyler Dache
## For the Coursera Course: "R programming" by Brian Caffo

## This function takes a matrix and returns a list of 3 functions:
## -A function to get the matrix itself
## -A function to get the inverse, which is then cached for later lookup
## -A function to set the matrix, which invalidates the cache of the inverse

makeCacheMatrix <- function(M = matrix()) {
    cache <- NA                 # stores the inverse of the matrix
    cache_valid <- FALSE
    list(
        get = function () {M},
        inverse = function () {
            if (cache_valid == FALSE) {
                cache <<- solve(M)
                cache_valid <<- TRUE
            }
            cache
        },
        set = function (new_m) {M <<- new_m; cache_valid <<- FALSE}
    )
}

## This function takes an object (list) returned by the above function,
## and returns it's inverse.

cacheSolve <- function(x, ...) {
    x$inverse() # If the inverse has been cached, it will be returned directly
                # otherwise, it will be calculated, saved and returned.
}
