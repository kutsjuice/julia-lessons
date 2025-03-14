# # For Loops and While Loops in Julia
#
# Loops are a fundamental concept in programming that allow you to repeat a block of code multiple times. In Julia, the two primary types of loops are `for` loops and `while` loops. These loops are used to iterate over a sequence of values or to repeat code until a certain condition is met.
#
# This lesson will introduce you to the syntax and usage of both `for` and `while` loops in Julia, with examples to illustrate their applications. At the end, you'll find exercises to practice what you've learned.

# ## For Loops
#
# A `for` loop is used to iterate over a sequence, such as a range of numbers, a list, or other iterable objects. The loop executes a block of code for each item in the sequence.
#
# ### Syntax
#
# ```julia
# for variable in sequence
#     # code to execute for each item in the sequence
# end
# ```
#
# - `variable` takes on the value of each item in the `sequence` one by one.
# - The loop continues until all items in the sequence have been processed.
#
# ### Example 1: Printing Numbers
#
# Let's print the numbers from 1 to 5.

for i in 1:5
    println(i)  # Print the value of i
end

# In this example, `i` takes on each value from 1 to 5, and each value is printed on a new line.

# ### Example 2: Summing Numbers
#
# You can use a `for` loop to calculate the sum of numbers from 1 to 10.
let
    sum = 0  # Initialize sum to 0
    for i in 1:10
        sum += i  # Add i to sum
    end
    println("The sum of numbers from 1 to 10 is $sum")
end

# Here, the loop adds each number from 1 to 10 to the variable `sum`, and the result (55) is printed after the loop completes.

# ## While Loops
#
# A `while` loop repeats a block of code as long as a specified condition is `true`. It is useful when the number of iterations is not known in advance and depends on some condition.
#
# ### Syntax
#
# ```julia
# while condition
#     # code to execute as long as condition is true
# end
# ```
#
# - The loop checks the `condition` before each iteration. If it is `true`, the code inside the loop is executed.
# - The loop stops when the `condition` becomes `false`.
#
# ### Example 3: Counting Up
#
# Let's use a `while` loop to count from 1 to 5.
let
    count = 1  # Start from 1
    while count <= 5
        println(count)
        count += 1  # Increase count by 1
    end
end

# In this example, the loop runs as long as `count` is less than or equal to 5. Each iteration prints the current value of `count` and increments it by 1.

# ### Example 4: Doubling a Number
#
# Let's double a number until it exceeds 50.
let
    number = 1  # Start with 1
    while number <= 50
        number *= 2  # Double the number
    end
    println("The first number greater than 50 is $number")
end
# Here, the loop doubles `number` starting from 1 (1, 2, 4, 8, 16, 32, 64) until it exceeds 50. The result (64) is then printed.

# ## Loop Control Statements
#
# Julia provides two keywords to control the flow of loops:
#
# - `break`: Exits the loop immediately, skipping any remaining iterations.
# - `continue`: Skips the current iteration and proceeds to the next one.
#
# ### Example 5: Using `break`
#
# Let's find the first number divisible by 3 between 10 and 20.

for i in 10:20
    if i % 3 == 0
        println("The first number divisible by 3 is $i")
        break  # Exit the loop once the number is found
    end
end

# The loop checks each number from 10 to 20 and stops when it finds 12, the first number divisible by 3.

# ### Example 6: Using `continue`
#
# Let's print only odd numbers from 1 to 10.

for i in 1:10
    if i % 2 == 0
        continue  # Skip even numbers
    end
    println(i)
end

# If `i` is even, the `continue` statement skips the `println` command, so only odd numbers (1, 3, 5, 7, 9) are printed.
# ## Nested Loops and Array Comprehensions in Julia
#
# Loops are a fundamental programming construct, and they can be nested to traverse multi-dimensional data structures like matrices. In Julia, nested loops are commonly used to initialize or manipulate matrix elements. Additionally, Julia offers concise alternatives, such as compact nested loop syntax and array comprehensions, which align with its expressive and efficient design.
#
# In this explanation, we'll explore how to use nested `for` loops to fill a matrix, how to write them more compactly, and how to leverage array comprehensions for a more idiomatic approach.

# ### Using Nested `for` Loops to Fill a Matrix
#
# A typical use case for nested loops is initializing a matrix with specific values. Here, we'll create a 5x5 matrix where each element `A[i, j]` is the sum of its row index `i` and column index `j`.
#
# First, define the matrix dimensions:

m, n = 5, 5  # m rows, n columns

# Then, create an uninitialized 5x5 matrix of 32-bit integers:

A = Array{Int32}(undef, m, n)

# Now, use nested `for` loops to populate the matrix. The outer loop iterates over columns (j), and the inner loop iterates over rows (i) for each column:

for j in 1:n
    for i in 1:m
        A[i, j] = i + j  # Set each element to i + j
    end
end

# After executing this, the matrix `A` is filled. For example, `A[1,1] = 2`, `A[2,3] = 5`, and so forth. Display the result:

# This produces the following 5x5 matrix:
A

# ### Compact Nested Loops in Julia
#
# Julia supports a more concise syntax for nested loops by separating loop variables with commas. This is equivalent to the traditional nested loop but written in a single line, making it ideal for simple iterations.
#
# Let’s create another 5x5 matrix `B` and fill it using this compact form:

B = Array{Int32}(undef, m, n)

for j in 1:n, i in 1:m
    B[i, j] = i + j  # Set each element to i + j
end

# This loop iterates over all combinations of `j` and `i`, producing the same result as the previous example. Display `B`:
# Output:
B

# ### Array Comprehensions: The Julia Way
#
# While nested loops are useful, Julia encourages the use of **array comprehensions** for creating arrays in a more concise and efficient manner. An array comprehension defines the array elements in a single expression, avoiding the need to pre-allocate and fill the array manually.
#
# Let’s create a matrix `C` using an array comprehension:

C = [i + j for i in 1:m, j in 1:n]

# This generates a 5x5 matrix where each element is `i + j`. The syntax `[expression for i in range, j in range]` directly constructs a 2D array. Display `C`:

# Output:
C
# Note that `C` uses `Int64` by default (depending on your system), unlike `A` and `B`, which were explicitly defined as `Int32`. You can enforce a specific type if needed, e.g., `[Int32(i + j) for i in 1:m, j in 1:n]`.

# ### Advantages of Array Comprehensions
#
# Array comprehensions are preferred in Julia because they:
# - Are more concise and readable.
# - Clearly express the intent of creating an array from a formula.
# - Can be optimized by Julia’s compiler for better performance.
#
# For example, `C = [i + j for i in 1:m, j in 1:n]` achieves the same result as the nested loops but with less code and often faster execution.

# ## Exercises
#
# Below are some exercises to practice using loops in Julia, based on the examples you requested. Each exercise is presented in English with its solution.
#
# ### Exercise 1: Print the squares of numbers from 1 to 100
#
# Print the square of each number from 1 to 100.

for i in 1:100
    println(i^2)
end

# This loop iterates over numbers from 1 to 100 and prints their squares (1, 4, 9, ..., 10000).

# ### Exercise 2: Create a dictionary `squares` with numbers and their squares
#
# Create a dictionary where the keys are numbers from 1 to 100 and the values are their squares.

let
    squares = Dict()
    for i in 1:100
        squares[i] = i^2
    end
## Check a few entries
println(squares[1])   # Should be 1
println(squares[10])  # Should be 100
println(squares[100]) # Should be 10000

end

# This creates a dictionary `squares` where, for example, `squares[5]` returns 25.

# ### Exercise 3: Create an array `squares_arr` with squares using a list comprehension
#
# Use a list comprehension to create an array containing the squares of numbers from 1 to 100.

squares_arr = [i^2 for i in 1:100]
# Check a few entries
println(squares_arr[1])   # Should be 1
println(squares_arr[10])  # Should be 100
println(squares_arr[100]) # Should be 10000

# This uses Julia's list comprehension syntax to efficiently create an array `[1, 4, 9, ..., 10000]`.

# ### Exercise 4: Create an array `primes` with all prime numbers from 1 to 100 using a `for` loop
#
# Create an array containing all prime numbers from 1 to 100. A prime number is a number greater than 1 that is divisible only by 1 and itself.

primes = Array{Int16,1}(undef, 0)  # Initialize an empty array of 16-bit integers
for i in 2:100
    b = false  # Flag to indicate if i is divisible by any number in primes
    for num in primes
        if i % num == 0
            b = true
            break  # Exit inner loop if i is divisible
        end
    end
    if !b
        push!(primes, i)  # Add i to primes if it’s not divisible by any previous prime
    end
end
println(primes)

# This code:
# - Starts with an empty array `primes`.
# - Checks each number `i` from 2 to 100.
# - Uses a nested loop to test if `i` is divisible by any number already in `primes`.
# - If `i` is not divisible (i.e., `b` remains `false`), it’s a prime and is added to `primes`.
# - The result is an array like `[2, 3, 5, 7, 11, ..., 97]`.
