library(dplyr)
library(moments)
library(lubridate)

analyze_time_series <- function(dataset) {
  dataset$Date <- as.Date(dataset$Date, format = "%d.%m.%Y")
  
  mean_value <- mean(dataset$Open)
  median_value <- median(dataset$Open)
  std_dev <- sd(dataset$Open)
  variance <- var(dataset$Open)
  
  # Calculating skewness and kurtosis
  skewness_value <- skewness(dataset$Open)
  kurtosis_value <- kurtosis(dataset$Open)
  
  # Creating dataframe for quartiles
  quartiles_df <- data.frame(
    Quantile = c("0%", "25%", "50%", "75%", "100%"),
    Value = quantile(dataset$Open, c(0, 0.25, 0.5, 0.75, 1))
  )
  
  correlation_coefficient <- cor(dataset$Open[-1], dataset$Open[-nrow(dataset)], method = "pearson")
  
  # Creating dataframe for analysis results
  analysis_results <- data.frame(
    Attribute = c("Mean", "Median", "Standard Deviation", "Variance", "Skewness", "Kurtosis", "Correlation Coefficient"),
    Value = c(mean_value, median_value, std_dev, variance, skewness_value, kurtosis_value, correlation_coefficient)
  )
  
  return(analysis_results)
}

# Example usage
time_series_data <- read.csv("/home/netherquark/Soham/Soham/Studies/Bachelors/SIT B.Tech (AI-ML)/first_year/Sem-II/STAIML/STAIML-CA/R/beijing_multi_site_air_quality_data.csv", header = TRUE, stringsAsFactors = FALSE)
analysis_results <- analyze_time_series(time_series_data)
print(analysis_results)
