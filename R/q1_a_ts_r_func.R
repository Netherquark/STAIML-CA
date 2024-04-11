library(dplyr)
library(moments)
library(lubridate)

analyze_time_series <- function(dataset) {
  dataset$Date <- as.Date(dataset$Date, format = "%d.%m.%Y")
  
  mean_value <- mean(dataset$Open)
  median_value <- median(dataset$Open)
  std_dev <- sd(dataset$Open)
  variance <- var(dataset$Open)

  skewness_kurtosis <- c(skewness(dataset$Open), kurtosis(dataset$Open))

  quartiles <- quantile(dataset$Open, c(0, 0.25, 0.5, 0.75, 1))

  correlation_coefficient <- cor(dataset$Open[-1], dataset$Open[-nrow(dataset)], method = "pearson")

  # Return results
  analysis_results <- list(mean = mean_value,
                           median = median_value,
                           std_deviation = std_dev,
                           variance = variance,
                           skewness_kurtosis = skewness_kurtosis,
                           quartiles = quartiles,
                           correlation_coefficient = correlation_coefficient)
  return(analysis_results)
}

time_series_data <- read.csv("/home/netherquark/Soham/Soham/Studies/Bachelors/SIT B.Tech (AI-ML)/first_year/Sem-II/STAIML/STAIML-CA/R/beijing_multi_site_air_quality_data.csv", header = TRUE, stringsAsFactors = FALSE)
analysis_results <- analyze_time_series(time_series_data)
print(analysis_results)

# Function to visualize data
visualize_data <- function(dataset) {  
  # Create scatter plot
  plot(dataset$Open, dataset$Volume, main = "Scatter Plot of Volume over Time", xlab = "Date", ylab = "Volume", col = "blue")
  
  # Create box plot
  boxplot(dataset$Open, main = "Box Plot of Volume", ylab = "Volume", col = "lightgreen")
  
  # Create histogram
  hist(dataset$Open, breaks = 20, main = "Histogram of Volume", xlab = "Volume", col = "skyblue", border = "black")
}

visualization_results <- visualize_data(time_series_data)