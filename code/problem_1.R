# problem: 1 - multiples of 3 and 5
# url: http://projecteuler.net/problem=1

# find the sum of all multiples of 3 or 5 below 1000.
#   method 1:
#   - find all multiples of 3 (mults_3)
#   - find all multiples of 5 (mults_5)
#   - take the union of the two sets (mults)
#   - sum over all elements (answer1)
#
#   method 2:
#   - find sum of all multiples of 3 (sum_3)
#   - find sum of all multiples of 5 (sum_5)
#   - find sum of all multiples of 3 and 5 (sum_15)
#   - answer2 = sum_3 + sum_5 - sum_15

# method 1 ----------------------------------------------------------------

# find all multiples of 3
mults_3 <- seq.int(from = 3, to = 999, by = 3)

# find all multiples of 5
mults_5 <- seq.int(from = 5, to = 999, by = 5)

# take the union of the multiples of 3 and the multiples of 5
mults <- union(x = mults_3, y = mults_5)

# sum over all elements of the union
answer1 <- sum(mults)

# method 2 ----------------------------------------------------------------

# sum of multiples of 3 below 1000
sum_3 <- 3 * (333 * 334) / 2

# sum of multiples of 5 below 1000
sum_5 <- 5 * (199 * 200) / 2

# sum of multiples of 3 and 5
sum_15 <- 15 * (66 * 67) / 2

# combine sums using inclusion-exclusion principle
answer2 <- sum_3 + sum_5 - sum_15