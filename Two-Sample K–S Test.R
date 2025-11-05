set.seed(123)
x1 <- rnorm(120, mean = 0, sd = 1)     # Sample 1 from N(0,1)
x2 <- rnorm(120, mean = 0.5, sd = 1)   # Sample 2 from N(0.5,1)

ks_result_two <- ks.test(x1, x2)
print(ks_result_two)

#There is a statistically significant difference between the distributions of x1 and x2 (p = 0.016).
#Since x2 was generated with a higher mean (0.5 vs 0), the KS test correctly detected this difference.