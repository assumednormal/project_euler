# problem: 2 - even fibonacci numbers
# url: http://projecteuler.net/problem=2

# find the sum of all even-valued fibonacci numbers whose value does not exceed
# 4000000
#   method 1:
#   - find index of maximum fibonacci number whose value does not exceed
#     4000000 (i_max)
#   - find all fibonacci numbers below 4000000 (fib_all)
#   - remove odd fibonacci numbers (fib_no_odds)
#   - sum over all remaining elements (answer1)
#
#   method 2:
#   - find index of maximum fibonacci number whose value does not exceed
#     4000000 (i_max)
#   - find every third fibonacci number (fib_thirds)
#   - sum over fib_thirds (answer2)

# globals -----------------------------------------------------------------

phi <- (1 + sqrt(5)) / 2

# method 1 ----------------------------------------------------------------

# find index of maximum fibonacci number whose value does not exceed 4000000
i_max <- floor(x = log(x = 4000000 * sqrt(x = 5), base = phi))

# find all fibonacci numbers below 4000000
fib_all <- round(x = phi^(1:i_max) / sqrt(x = 5), digits = 0)

# remove odd fibonacci numbers
fib_no_odds <- fib_all[sapply(X = fib_all, FUN = function(t) t %% 2 == 0)]

# sum over all remaining elements
answer1 <- sum(fib_no_odds)

# method 2 ----------------------------------------------------------------

# find index of maximum fibonacci number whose value does not exceed 4000000
i_max <- floor(x = log(x = 4000000 * sqrt(x = 5), base = phi))

# find every third fibonacci number
fib_thirds <- round(x = phi^seq.int(from = 3, to = i_max, by = 3) / sqrt(x = 5),
                    digits = 0)

# sum over fib_thirds
answer2 <- sum(fib_thirds)
