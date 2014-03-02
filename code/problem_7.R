# problem: 7 - 10001st prime
# url: http://projecteuler.net/problem=7

# find the 10001st prime
#   method 1:
#   - choose a limit (limit)
#   - find all primes up to limit using a sieve (primes)
#   - pull 10001st prime from primes if it exists, otherwise run again with a
#     higher limit (answer1)
#
#   method 2:
#   - initiate a vector of known primes (prime_list)
#   - for each odd number n beyond 13, check if divisible by known primes below
#     sqrt(n) until 10001 primes are found (prime_list)
#   - the 10001st prime is the last element of prime_list (answer2)

# method 1 ----------------------------------------------------------------

# choose a limit
limit <- 1000000

# find all primes up to limit using a sieve
primes <- c(2, seq.int(from = 3, to = limit, by = 2))
idx <- 2
prime <- primes[idx]
multiples <- tryCatch(expr = seq.int(from = prime**2, to = limit, by = prime),
                      error = function(e) 0)
common <- intersect(x = primes, y = multiples)
while(length(x = common) > 0 & idx < length(x = primes)) {
  primes <- setdiff(x = primes, y = common)
  idx <- idx + 1
  prime <- primes[idx]
  multiples <- tryCatch(expr = seq.int(from = prime**2, to = limit, by = prime),
                        error = function(e) 0)
  common <- intersect(x = primes, y = multiples)
}

# pull 10001st prime
answer1 <- primes[10001]


# method 2 ----------------------------------------------------------------

# initial vector of primes
prime_list <- c(2, 3, 5, 7, 11, 13)

# for each odd number n beyond 13, check if divisible by known primes below
# sqrt(n) until 10001 primes are found
n <- 15
while(length(x = prime_list) < 10001) {
  max_factor <- floor(x = sqrt(x = n))
  is_prime <- 1
  for(p in prime_list[prime_list <= max_factor]) {
    if(n %% p == 0) {
      is_prime <- 0
      break
    }
  }
  if(is_prime == 1) {
    prime_list <- c(prime_list, n)
  }
  n <- n + 2
}

# the 10001st prime is the last element of prime_list
answer2 <- prime_list[10001]