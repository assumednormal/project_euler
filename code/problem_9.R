# problem: 9 - special pythagorean triplet
# url: http://projecteuler.net/problem=9

# there is a pythagorean triplet (a, b, c) with a < b < c such that
# a + b + c = 1000. find the product a * b * c.
#   method 1:
#   - loop through all combinations of (a, b, c) with a < b < c (a, b, c)
#   - find the product of a, b, and c (answer1)

# method 1 ----------------------------------------------------------------

# loop through all combinations of (a, b, c) with a < b < c
done <- 0
for(a in 1:332) {
  for(b in (a + 1):floor(x = (999 - a) / 2)) {
    c <- 1000 - a - b
    cat("a = ", a, "\tb = ", b, "\tc = ", c, "\n", sep = "")
    if(a**2 + b**2 == c**2) {
      done <- 1
      break
    }
  }
  if(done == 1) break
}

# find the product of a, b, and c
answer1 <- a * b * c