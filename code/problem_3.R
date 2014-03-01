# problem: 3 - largest prime factor
# url: http://projecteuler.net/problem=3

# find the largest prime factor of 600851475143
#   method 1:
#   - at least one prime factor must lie below sqrt(600851475143) (max_factor)
#   - list all prime numbers below max_factor using a sieve (primes)
#   - search for factors among primes (factors) and their complements
#     (complements)
#   - check if complements are prime (prime_complements)
#   - get largest prime from factors and prime_complements (answer1)


# method 1 ----------------------------------------------------------------

# at least one prime factor must lie below sqrt(600851475143)
max_factor <- floor(x = sqrt(x = 600851475143))

# use a sieve to generate primes below sqrt(600851475143)
primes <- seq.int(from = 2, to = max_factor, by = 1)
idx <- 1
prime <- primes[idx]
multiples <- tryCatch(expr = seq.int(from = prime**2, to = max_factor,
                                     by = prime),
                      error = function(e) 0)
common <- intersect(x = primes, y = multiples)
while(length(x = common) > 0 & idx < length(x = primes)) {
  primes <- setdiff(x = primes, y = common)
  idx <- idx + 1
  prime <- primes[idx]
  multiples <- tryCatch(expr = seq.int(from = prime**2, to = max_factor,
                                       by = prime),
                        error = function(e) 0)
  common <- intersect(x = primes, y = multiples)
}

# search for factors among the primes
complements <- sapply(X = primes, FUN = function(f) {
  ifelse(test = 600851475143 %% f == 0, yes = 600851475143 / f, no = 0)
})
factors <- primes[complements > 0]
complements <- complements[complements > 0]

# check if complements are prime
prime_complements <- sapply(X = complements, FUN = function(f) {
                              !any(f %% primes[primes < sqrt(x = f)] == 0)
                            })

# answer is maximum among primes and prime complements
answer1 <- max(factors, complements[prime_complements])