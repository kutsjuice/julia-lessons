# Condition Statements in Julia

Conditional statements are a fundamental part of programming. They allow a program to execute different blocks of code based on whether certain conditions are true or false. This ability to make decisions is crucial for controlling the flow of a program and handling various scenarios dynamically.

In Julia, the primary conditional statements are `if`, `elseif`, and `else`. These keywords are used to define the conditions and the corresponding actions to take.

Conditions in Julia are expressions that evaluate to a boolean value, either `true` or `false`. These can be comparisons (e.g., `x > 5`), logical operations (e.g., `x > 5 && x < 10`), or any function that returns a boolean.

## The `if` Statement

The `if` statement is the simplest form of a conditional statement. It checks a condition, and if that condition is true, it executes the block of code that follows.

### Syntax

```julia
if condition
    # code to execute if condition is true
end
```

### Example

Let's check if a number is positive.

````julia
x = 5  # Define a variable x with value 5
if x > 0  # Check if x is greater than 0
    println("x is positive")  # If true, print this message
end
````

````
x is positive

````

In this example, since `x` is 5, which is greater than 0, the condition `x > 0` is true, and the program prints "x is positive".

## The `else` Statement

The `else` statement complements the `if` statement by providing an alternative block of code to execute when the `if` condition is false.

### Syntax

```julia
if condition
    # code to execute if condition is true
else
    # code to execute if condition is false
end
```

### Example

Extending the previous example, we can handle both positive and non-positive numbers.

````julia
x = -3  # Define x with a negative value
if x > 0  # Check if x is greater than 0
    println("x is positive")
else  # If the condition is false
    println("x is not positive")
end
````

````
x is not positive

````

Here, since `x` is -3, which is not greater than 0, the `else` block executes, printing "x is not positive".

## The `elseif` Statement

When there are multiple conditions to check, the `elseif` statement is used. It allows checking additional conditions if the previous ones are false.

### Syntax

```julia
if condition1
    # code if condition1 is true
elseif condition2
    # code if condition2 is true
else
    # code if none of the above conditions are true
end
```

### Example

Suppose we want to grade a score based on these criteria:

- 90 or above: A
- 80 to 89: B
- 70 to 79: C
- Below 70: F

````julia
score = 85  # Define a score
if score >= 90  # Check if score is 90 or higher
    println("Grade: A")
elseif score >= 80  # Check if score is 80 or higher
    println("Grade: B")
elseif score >= 70  # Check if score is 70 or higher
    println("Grade: C")
else  # If none of the above are true
    println("Grade: F")
end
````

````
Grade: B

````

Since the score is 85, which is between 80 and 89, the program prints "Grade: B".

## Nested Conditional Statements

Conditional statements can be nested inside each other, allowing for more complex decision-making.

### Example

Let's check if a number is within a specific range, say between 10 and 20.

````julia
x = 15  # Define x
if x > 10  # Outer condition: check if x is greater than 10
    if x < 20  # Inner condition: check if x is less than 20
        println("x is between 10 and 20")
    else
        println("x is 20 or greater")
    end
else
    println("x is 10 or less")
end
````

````
x is between 10 and 20

````

Since `x` is 15, it satisfies both conditions (greater than 10 and less than 20), so it prints "x is between 10 and 20".

## Short-Circuit evaluations

Short-circuit evaluation is a powerful optimization in Julia that applies to logical operators like `&&` (and) and `||` (or). It allows the computer to skip unnecessary computations, making your code more efficient. Let’s explore how it works with examples.

### The `&&` Operator

The expression `a && b` returns `true` only if both `a` and `b` are `true`. If `a` is `false`, Julia immediately returns `false` without evaluating `b`. This is called short-circuiting.

````julia
false && (println("This won't run"); true)
````

````
false
````

In the example above, `"This won't run"` is not printed because `false` on the left short-circuits the evaluation, skipping the second part entirely. This is especially useful when the second part is computationally expensive.

Now, consider a case where the first part is `true`:

````julia
true && (println("This will run"); true)
````

````
true
````

Here, since the first part is `true`, Julia evaluates the second part, printing `"This will run"` and returning `true` because both operands are `true`.

Interestingly, when `a` is `true`, the result of `a && b` is simply the value of `b`. This means `b` doesn’t even need to be a boolean—it could be any value:

````julia
x = 5
(x > 0) && "Positive"
````

````
"Positive"
````

If `x > 0` is `true`, the result is `"Positive"`. If `x <= 0`, it returns `false` without evaluating the second part.

### The `||` Operator

The `||` operator returns `true` if either `a` or `b` is `true`. If `a` is `true`, Julia short-circuits and returns `true` without evaluating `b`.

````julia
true || println("This won't run")
````

````
true
````

Here, since the first part is `true`, the second part is skipped, and the result is `true`.

Contrast this with:

````julia
false || println("This will run")
````

````
This will run

````

Since the first part is `false`, Julia evaluates the second part, printing `"This will run"`. The result of `println` is `nothing`, but in a boolean context, the overall expression depends on how it’s used.

## Ternary Operator

The ternary operator provides a concise way to write simple if-else statements. Its syntax is:

```julia
condition ? expression_if_true : expression_if_false
```

### Example

````julia
x = 7  # Define x
result = x > 0 ? "positive" : "non-positive"  # Ternary operator assigns value to result
println(result)
````

````
positive

````

Since `x` is 7, which is greater than 0, `result` is set to "positive", and that is printed.

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

