# problem: 3 - largest prime factor
# url: http://projecteuler.net/problem=3

# find the largest prime factor of 600851475143
#   method 1:
#   - list all prime numbers below sqrt(600851475143) using a sieve (primes)
#   - search for factors from primes (factors)
#   - get largest prime from factors (max_prime)


# method 1 ----------------------------------------------------------------

# at least one prime factor must lie below sqrt(600851475143)
max_factor <- floor(x = sqrt(x = 600851475143))

# use a sieve to generate primes below sqrt(600851475143)
primes <- seq.int(from = 2, to = max_factor, by = 1)
idx <- 1
prime <- primes[idx]
multiples <- tryCatch(expr = seq.int(from = 2 * prime, to = max_factor,
                                     by = prime),
                      error = function(e) 0)
common <- intersect(x = primes, y = multiples)
while(length(x = common) > 0 & idx < length(x = primes)) {
  primes <- setdiff(x = primes, y = common)
  idx <- idx + 1
  prime <- primes[idx]
  multiples <- tryCatch(expr = seq.int(from = 2 * prime, to = max_factor,
                                       by = prime),
                        error = function(e) 0)
  common <- intersect(x = primes, y = multiples)
}

# search for factors among the primes
factor_list <- primes
