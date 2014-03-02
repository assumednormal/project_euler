# problem: 6 - sum square difference
# url: http://projecteuler.net/problem=6

# find the difference between the sum of the squares and the square of the sum of
# the first 100 natural numbers: 1, 2, 3, ..., 100
#   method 1:
#   - calculate the sum of the squares (sum_sq)
#   - calculate the square of the sum (sq_sum)
#   - take the difference of sum_sq and sq_sum (answer1)


# method 1 ----------------------------------------------------------------

# calculate the sum of the squares
sum_sq <- sum((1:100)^2)

# calculate the square of the sum
sq_sum <- sum(1:100)^2

# take the difference of sum_sq and sq_sum
answer1 <- abs(sum_sq - sq_sum)