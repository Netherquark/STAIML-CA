# Function to generate Fibonacci sequence using for loop
fibonacci_for <- function(n) {
  fib <- numeric(n)
  fib[1] <- 0
  fib[2] <- 1
  for (i in 3:n) {
    cat("Loop number:", i)
    fib[i] <- fib[i - 1] + fib[i - 2]
    cat(" fib[i]:", fib[i], "\n")
  }
  return(fib)
}

# Function to generate Fibonacci sequence using while loop
fibonacci_while <- function(n) {
  fib <- numeric(n)
  fib[1] <- 0
  fib[2] <- 1
  i <- 3
  while (i <= n) {
    cat("Loop number:", i)
    fib[i] <- fib[i - 1] + fib[i - 2]
    cat(" fib[i]:", fib[i], "\n")
    i <- i + 1
  }
  return(fib)
}

# Print explanation for for loop
cat("Explanation (for loop):\n")
cat("The for loop in this program is used to generate the Fibonacci sequence. It starts by initializing an empty vector with 'numeric(n)' where 'n' is the desired length of the sequence. The first two elements of the sequence are set manually to 0 and 1. Then, the loop iterates from the third element onwards (i = 3 to n). At each iteration, the current Fibonacci number is calculated by adding the previous two numbers. Finally, the function returns the generated Fibonacci sequence.\n\n")
cat("Demonstration of Fibonacci sequence using for loop:\n \n")
# Print Fibonacci sequence generated using for loop
cat("\nFibonacci sequence using for loop: ", fibonacci_for(10), "\n")

# Print explanation for while loop
cat("\nExplanation for the while loop:\n")
cat("The while loop in this program is also used to generate the Fibonacci sequence. It starts by initializing an empty vector similar to the for loop method. A loop counter 'i' is initialized outside the loop and set to 3, the index of the third Fibonacci number. The loop continues until 'i' reaches 'n', the desired length of the sequence. Within the loop, the current Fibonacci number is calculated similar to the for loop method. The loop counter 'i' is then incremented by 1 in each iteration. Finally, the function returns the generated Fibonacci sequence.\n\n")
cat("Demonstration of Fibonacci sequence using for loop:\n \n")

# Print Fibonacci sequence generated using while loop
cat("\nFibonacci sequence using while loop: ", fibonacci_while(10), "\n")
