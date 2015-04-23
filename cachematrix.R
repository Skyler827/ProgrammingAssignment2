## cachematrix.R - Programming assignment 2 by Skyler Dache
## For the Coursera Course: "R programming" by Brian Caffo

## This function takes a matrix and returns a list of 3 functions:
## -A function to get the value of the matrix
## -A function to get the inverse, which is then cached for later lookup
## -A function to change the matrix, which deletes the cache of the inverse

makeCacheMatrix <- function(m = matrix()) {
    .inverse <- NA                         # stores an inverse matrix, or NA
    list(
        get = function () {m},
        inverse = function () {
            if (anyNA(.inverse)) {         # anyNA() is used insteady of is.na()
                .inverse <<- solve(m)      # to suppress warning when .inverse
                .inverse                   # is a matrix.
            } else {.inverse}
        }
        set = function (new_m) {x <<- new_x; .inverse <<- NA},
    )
}

## This function takes an object (list) returned by the above function,
## and returns it's inverse.

cacheSolve <- function(x, ...) {
    x$inverse() # If the inverse has been cached, it will be returned directly
                # otherwise, it will be calculated, saved and returned.
}
