NUMERIC_VAR <- "math.score"  # same column
x_real <- na.omit(my_data[[NUMERIC_VAR]])

# One-sample K-S test
ks_result_one <- ks.test(x_real, "pnorm",
                         mean = mean(x_real), sd = sd(x_real))

cat("\n--- ONE-SAMPLE K-S TEST ---\n")
print(ks_result_one)

# Interpretation
if (ks_result_one$p.value > 0.05) {
  cat("Interpretation: Fail to reject null → data follows normal distribution.\n")
} else {
  cat("Interpretation: Reject null → data does not follow normal distribution.\n")
}
