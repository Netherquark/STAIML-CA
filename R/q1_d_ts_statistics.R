analyze_correlation <- function(dataset) {
  correlation_coefficient <- cor(dataset$Open, dataset$High, method = "pearson")
  
  # Determine statistical significance
  n <- nrow(dataset)
  degrees_freedom <- n - 2
  t_value <- abs(correlation_coefficient) * sqrt(degrees_freedom) / sqrt(1 - correlation_coefficient^2)
  p_value <- 2 * pt(-abs(t_value), df = degrees_freedom)
  is_significant <- p_value < 0.05
  
  # Return results
  analysis_results <- list(
    correlation_coefficient = correlation_coefficient,
    is_significant = is_significant,
    p_value = p_value
  )
  return(analysis_results)
}

# Read data from file or use your own dataset
time_series_data <- read.csv("/home/netherquark/Soham/Soham/Studies/Bachelors/SIT B.Tech (AI-ML)/first_year/Sem-II/STAIML/STAIML-CA/R/beijing_multi_site_air_quality_data.csv", header = TRUE, stringsAsFactors = FALSE)

# Call the analysis function
analysis_results <- analyze_correlation(time_series_data)
print(analysis_results)

# Function to visualize data
visualize_data <- function(dataset) {  
  # Create scatter plot
  plot(dataset$Open, dataset$High, main = "Scatter Plot of Open vs High", xlab = "Open", ylab = "High", col = "blue")
}

# Call the visualization function
visualize_data(time_series_data)
