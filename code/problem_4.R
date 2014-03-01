# problem: 4 - largest palindrome product
# url: http://projecteuler.net/problem=4

# find the largest palindrome made from the product of two 3-digit numbers
#   method 1:
#   - find all products of two 3-digit numbers (products)
#   - remove all products divisible by 10 (products)
#   - find all palindromes (palindromes)
#   - find largest number that is also a palindrome (answer1)

# method 1 ----------------------------------------------------------------

# products of all 3-digit numbers
products <- vector(mode = "integer", length = 900 * 901 / 2)
idx <- 1
for(i in 100:999) {
  for(j in i:999) {
    products[idx] <- i * j
    idx <- idx + 1
  }
}
products <- sort(x = unique(x = products))

# remove all numbers divisible by 10
products <- products[products %% 10 != 0]

# find all palindromes
palindromes <- sapply(X = products, FUN = function(p) {
  palindrome <- 0
  char_p <- strsplit(x = paste0(p), split = NULL)[[1]]
  if(identical(x = char_p, y = rev(x = char_p))) palindrome <- 1
  palindrome
})

# find largest number that is also a palindrome
answer1 <- max(products[palindromes == 1])