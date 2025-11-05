set.seed(123)
x <- rnorm(150, mean = 0, sd = 1)  # example data
# One-sample KS against N(0,1)
ks_result_one <- ks.test(x, "pnorm", mean = 0, sd = 1)
print(ks_result_one)

#There is no significant evidence to say that the sample distribution is different from a Normal(0,1) distribution.
#The data likely comes from a standard normal distribution.