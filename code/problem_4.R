# problem: 4 - largest palindrome product
# url: http://projecteuler.net/problem=4

# find the largest palindrome made from the product of two 3-digit numbers
#   method 1:
#   - find all products of two 3-digit numbers (products)


# method 1 ----------------------------------------------------------------

# products of all 3-digit numbers
products <- vector(mode = "character", length = 900 * 901 / 2)
idx <- 1
for(i in 100:999) {
  for(j in i:999) {
    products[idx] <- paste0(i * j)
    idx <- idx + 1
  }
}
products <- sort(x = unique(x = products))

# 