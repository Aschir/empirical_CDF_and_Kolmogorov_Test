# Load necessary library
library(ggplot2)

# Load CSV dataset
my_data <- read.csv("C:/Users/BalajiGovindarajan/Downloads/archive (1)/StudentsPerformance.csv")

# Select numeric variable (score) and grouping variable
NUMERIC_VAR <- "math.score"       # You can also use reading.score or writing.score
GROUP_VAR <- "gender"             # Gender has two groups: male and female

# Remove missing values if any
my_data <- subset(my_data, !is.na(my_data[[NUMERIC_VAR]]) & my_data[[GROUP_VAR]] != "")

# Extract numeric samples by group
sample_1 <- my_data[my_data[[GROUP_VAR]] == "female", NUMERIC_VAR]
sample_2 <- my_data[my_data[[GROUP_VAR]] == "male", NUMERIC_VAR]

# Two-sample K-S test
ks_result <- ks.test(sample_1, sample_2)
cat("\n--- TWO-SAMPLE K-S TEST ---\n")
print(ks_result)

# ECDF plot for two groups
ecdf_1 <- ecdf(sample_1)
ecdf_2 <- ecdf(sample_2)

plot(ecdf_1, verticals = TRUE, do.points = FALSE, col = "blue",
     main = paste("ECDF Comparison by", GROUP_VAR),
     xlab = NUMERIC_VAR, ylab = "Cumulative Probability")
lines(ecdf_2, verticals = TRUE, do.points = FALSE, col = "red")

legend("bottomright", legend = c("Female", "Male"),
       col = c("blue", "red"), lty = 1)

# Add p-value to the plot
text_x <- mean(c(min(c(sample_1, sample_2)), max(c(sample_1, sample_2))))
text_y <- 0.1
text(text_x, text_y, labels = paste("KS-test p-value =", signif(ks_result$p.value, 4)), col = "black", cex = 0.9)
