library(dplyr)
library(moments)
library(lubridate)

# Function to analyze time-series dataset
analyze_time_series <- function(dataset) {
  dataset$Date <- as.Date(dataset$Date, format = "%d.%m.%Y")
  
  # Calculate mean, median, standard deviation, variance for 'Open'
  mean_value <- mean(dataset$Open)
  median_value <- median(dataset$Open)
  std_dev <- sd(dataset$Open)
  variance <- var(dataset$Open)
  
  # Calculate skewness and kurtosis for 'Open'
  skewness_kurtosis <- c(skewness(dataset$Open), kurtosis(dataset$Open))
  
  # Calculate quartiles for 'Open'
  quartiles <- quantile(dataset$Open, c(0, 0.25, 0.5, 0.75, 1))
  
  # Calculate Pearson's correlation coefficient between 'Date' and 'Open'
  # correlation_coefficient <- cor(as.numeric(dataset$Date), dataset$Open, method = "pearson")
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

# Example usage of functions
time_series_data <- read.csv("/home/netherquark/Soham/Soham/Studies/Bachelors/SIT B.Tech (AI-ML)/first_year/Sem-II/STAIML/STAIML-CA/R/beijing_multi_site_air_quality_data.csv", header = TRUE, stringsAsFactors = FALSE)
analysis_results <- analyze_time_series(time_series_data)
print(analysis_results)