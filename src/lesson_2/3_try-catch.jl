# # Error Handling in Julia

# Robust error handling is essential for writing reliable code. This lesson explores Julia's exception handling mechanisms using `try`-`catch` blocks and related constructs.

# ## Throwing Exceptions

# Exceptions can be raised manually using the `error` function. Let's create a function that throws an error for negative inputs:

function sqrt_if_positive(x)
    if x < 0
        error("Negative input not allowed")
    else
        return sqrt(x)
    end
end

# ## Basic `try`-`catch` Syntax

# The `try`-`catch` block allows handling potential exceptions. Code that might throw errors goes in the `try` block, with error handling in `catch`:

try
    x = 1 / 0
catch e
    println("Caught an error: ", e)
end

# ## Handling Specific Exceptions

# We can check exception types using `isa` for more granular handling:

try
    x = 1 / 0
catch e
    if e isa DivideError
        println("Division error handled: ", e)
    else
        println("Other error occurred: ", e)
    end
end

# ## Array Bounds Checking

# Here's an example handling out-of-bounds array access:

arr = [1, 2, 3]
try
    println(arr[4])
catch e
    println("Array access error: ", e)
end

# ## The `finally` Clause

# Use `finally` for cleanup code that always executes, regardless of exceptions:

f = open("testfile.txt", "w")
try
    write(f, "Important data")
catch e
    println("Write error: ", e)
finally
    close(f)
    println("File closed successfully")
end

# ## Rethrowing Exceptions

# After partial handling, you can rethrow exceptions for higher-level handling:

try
    sqrt_if_positive(-5)
catch e
    println("Logging error: ", e)
    rethrow()  # Propagates the exception up
end

# ## Custom Error Handling

# Let's combine these concepts in a complete example:

function process_data(data)
    try
        if length(data) < 3
            error("Insufficient data length")
        end
        return data[1] / data[3]
    catch e
        if e isa DivideError
            println("Division error handled")
            return NaN
        elseif e isa BoundsError
            println("Bounds error handled")
            return 0.0
        else
            println("Unknown error: ", e)
            rethrow()
        end
    finally
        println("Data processing complete")
    end
end

# Test cases:
process_data([1, 2, 0])  # Division error
process_data([1])        # Bounds error
process_data([1, 2, 3])  # Successful case

# ## Best Practices

# 1. Use specific exception handling when possible
# 2. Always clean up resources with `finally`
# 3. Only catch exceptions you can handle meaningfully
# 4. Use `rethrow()` judiciously to preserve stack traces

# For more information, see the official Julia documentation on [Exception Handling](https://docs.julialang.org/en/v1/manual/control-flow/#Exception-Handling).