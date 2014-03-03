# problem: 10 - summation of primes
# url: http://projecteuler.net/problem=10

# find the sum of all primes below 2000000
#   method 1:
#   - find all primes below 2000000 (primes)
#   - sum up primes (answer1)

# method 1 ----------------------------------------------------------------

# find all primes below 2000000
primes <- c(2, seq.int(from = 3, to = 1999999, by = 2))
idx <- 2
prime <- primes[idx]
multiples <- tryCatch(expr = seq.int(from = prime**2, to = 1999999, by = prime),
                      error = function(e) 0)
common <- intersect(x = primes, y = multiples)
while(length(x = common) > 0 & idx < length(x = primes)) {
  primes <- setdiff(x = primes, y = common)
  idx <- idx + 1
  prime <- primes[idx]
  multiples <- tryCatch(expr = seq.int(from = prime**2, to = 1999999,
                                       by = prime),
                        error = function(e) 0)
  common <- intersect(x = primes, y = multiples)
}

# sum up primes
answer1 <- sum(primes)