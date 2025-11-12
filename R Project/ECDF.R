# Load dataset
my_data <- read.csv("C:/Users/BalajiGovindarajan/Downloads/archive (1)/StudentsPerformance.csv")

NUMERIC_VAR <- "math.score"  # replace with the numeric column you want
x_real <- na.omit(my_data[[NUMERIC_VAR]])

# Custom ECDF function
my_ecdf <- function(data) {
  data <- sort(data)
  n <- length(data)
  y <- seq(1, n) / n
  return(list(x = data, y = y))
}

# Compute ECDF
ecdf_res <- my_ecdf(x_real)

# Plot ECDF vs Theoretical Normal CDF
plot(ecdf_res$x, ecdf_res$y, type = "s",
     main = paste("Empirical CDF vs Theoretical Normal CDF for", NUMERIC_VAR),
     xlab = "Value", ylab = "Cumulative Probability",
     col = "blue", lwd = 2)

# Overlay normal CDF
curve(pnorm(x, mean = mean(x_real), sd = sd(x_real)),
      add = TRUE, col = "red", lwd = 2)

legend("bottomright",
       legend = c("Empirical CDF (Data)", "Theoretical Normal CDF"),
       col = c("blue", "red"), lwd = 2)
