# problem: smallest multiple
# url: http://projecteuler.net/problem=5

# find the smallest positive number that is evenly divisble by all numbers from 1
# to 20
#   method 1:
#   - find all primes below 20 (primes)
#   - determine multiplicities for each prime, which is the same as finding the
#     highest multiplicity of each prime within each of the numbers from 1 to 20
#     (multiplicities)
#   - take the product of all primes raised to their multiplicities (answer1)

# method 1 ----------------------------------------------------------------

# find all primes below 20
primes <- seq.int(from = 2, to = 20, by = 1)
idx <- 1
prime <- primes[idx]
multiples <- tryCatch(expr = seq.int(from = prime**2, to = 20, by = prime),
                      error = function(e) 0)
common <- intersect(x = primes, y = multiples)
while(length(x = common) > 0 & idx < length(x = primes)) {
  primes <- setdiff(x = primes, y = common)
  idx <- idx + 1
  prime <- primes[idx]
  multiples <- tryCatch(expr = seq.int(from = prime**2, to = 20, by = prime),
                        error = function(e) 0)
  common <- intersect(x = primes, y = multiples)
}

# find multiplicities for each prime
multiplicities <- rep(x = 1, length.out = length(primes))
for(i in 2:20) {
  for(j in 1:length(x = primes)) {
    k <- 0
    while(i %% primes[j]^(k + 1) == 0) k <- k + 1
    multiplicities[j] <- max(multiplicities[j], k)
  }
}

# take product of primes raised to multiplicities
answer1 <- prod(primes^multiplicities)