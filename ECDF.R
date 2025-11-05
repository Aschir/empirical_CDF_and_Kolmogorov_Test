my_ecdf <- function(data) {
  n <- length(data)
  sorted <- sort(data)
  y <- (1:n) / n
  data.frame(x = sorted, y = y)
}
sample_data <- c(4, 2, 7, 1, 9, 3)

result <- my_ecdf(sample_data)
View(result)

# Step plot of your ECDF
plot(result$x, result$y,
     type = "s",  # "s" = step plot
     col = "blue",
     lwd = 2,
     xlab = "Data values",
     ylab = "ECDF",
     main = "Empirical Cumulative Distribution Function")
grid()
