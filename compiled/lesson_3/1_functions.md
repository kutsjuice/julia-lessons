# Functions in Julia

Functions are a fundamental concept in Julia, allowing you to encapsulate code into reusable blocks. In this lesson, we'll explore how to define and use functions in Julia, covering various aspects such as syntax, return values, arguments, operators, and documentation.

## Basic Syntax

There are two primary ways to define a function in Julia: the long form and the short form.

### Long Form

The long form uses the `function` keyword followed by the function name, parameters, and the `end` keyword to close the function body.

````julia
function add(x, y)
    return x + y
end
````

````
add (generic function with 1 method)
````

### Short Form

The short form is a more concise way to define functions, especially for simple one-liners. It uses the assignment syntax with the function name and parameters on the left and the expression on the right.

````julia
add(x, y) = x + y
````

````
add (generic function with 1 method)
````

Both forms are equivalent, and the choice between them is often a matter of style or readability. For functions with multiple lines or more complex logic, the long form is generally preferred.

Here's an example showing that both definitions work the same way:

````julia
result1 = add(2, 3)  # result1 is 5 (using either definition)
println(result1)
````

````
5

````

## Returned Values

Functions in Julia can return values in several ways.

### Single Value

The most straightforward case is returning a single value.

````julia
function square(x)
    return x * x
end

result = square(4)  # result is 16
println(result)
````

````
16

````

### Multiple Values

You can return multiple values by returning a tuple.

````julia
function divide_and_remainder(a, b)
    div = a ÷ b
    rem = a % b
    return div, rem
end

quotient, remainder = divide_and_remainder(10, 3)  # quotient is 3, remainder is 1
println("Quotient: $quotient, Remainder: $remainder")
````

````
Quotient: 3, Remainder: 1

````

When you return multiple values like this, Julia actually returns a tuple, which can be unpacked into separate variables.

### Named Tuples

For better clarity, especially when returning multiple values, you can use named tuples.

````julia
function divide_and_remainder_named(a, b)
    div = a ÷ b
    rem = a % b
    return (division=div, remainder=rem)
end

result = divide_and_remainder_named(10, 3)
println("Division: $(result.division)")    # prints 3
println("Remainder: $(result.remainder)")  # prints 1
````

````
Division: 3
Remainder: 1

````

### Returning Nothing

Sometimes, a function doesn’t need to return a value, especially if it’s performing some side effect like printing. In such cases, you can use `nothing`, a special value in Julia.

````julia
function print_greeting(name)
    println("Hello, $(name)!")
    return nothing
end

print_greeting("Alice")  # prints "Hello, Alice!" and returns nothing
````

````
Hello, Alice!

````

### Omitting the Return Statement

In Julia, if you don’t specify a `return` statement, the function returns the value of the last expression evaluated.

````julia
function implicit_return(x)
    x + 1
end

result = implicit_return(5)  # result is 6
println(result)
````

````
6

````

Be careful with implicit returns to ensure the last expression is what you intend to return.

## Arguments

Functions can take various types of arguments to make them more flexible.

### Positional Arguments

Positional arguments are the standard way to pass inputs to a function, where the order matters.

````julia
function subtract(x, y)
    return x - y
end

result = subtract(5, 3)  # result is 2
println(result)
````

````
2

````

### Keyword Arguments

Keyword arguments allow you to specify arguments by name, making function calls more readable. They are defined after a semicolon in the function signature.

````julia
function plot(x, y; color="red", linewidth=1)
    println("Plotting with color $color and linewidth $linewidth")
end

plot(1:5, rand(5), color="blue", linewidth=2)
````

````
Plotting with color blue and linewidth 2

````

Keyword arguments can be provided in any order, as long as they come after positional arguments.

### Default Values

Both positional and keyword arguments can have default values, making them optional.

For positional arguments:

````julia
function greet(name="world")
    println("Hello, $(name)!")
end

greet()       # prints "Hello, world!"
greet("Bob")  # prints "Hello, Bob!"
````

````
Hello, world!
Hello, Bob!

````

For keyword arguments, see the `plot` function above, where `color` and `linewidth` have defaults.

### Splatting Arguments

Splatting allows you to pass a collection of values as individual arguments using the `...` operator.

For positional arguments:

````julia
args = (1, 2)
result = add(args...)  # equivalent to add(1, 2)
println(result)        # prints 3
````

````
3

````

For keyword arguments, you can splat a named tuple:

````julia
kwargs = (color="green", linewidth=3)
plot(1:5, rand(5); kwargs...)
````

````
Plotting with color green and linewidth 3

````

## Operators

In Julia, operators are functions and can be used in prefix form.

````julia
result = +(1, 2)  # equivalent to 1 + 2
println(result)   # prints 3
````

````
3

````

This property allows operators to be treated like any other function, as we’ll see next.

## Passing Functions to Other Functions and Assigning to Variables

Julia treats functions as first-class citizens, meaning you can assign them to variables and pass them to other functions.

### Assigning Functions to Variables

You can assign a function (including operators) to a variable:

````julia
myadd = +
result = myadd(3, 4)  # result is 7
println(result)

myfunc = add
result = myfunc(5, 6)  # result is 11
println(result)
````

````
7
11

````

### Passing Functions to Other Functions

You can pass functions as arguments to other functions. For example, `map` applies a function to each element of a collection:

````julia
squares = map(square, [1, 2, 3])  # squares is [1, 4, 9]
println(squares)
````

````
[1, 4, 9]

````

### Anonymous Functions

Anonymous functions are defined on-the-fly using the `->` syntax, useful for short tasks:

````julia
result = map(x -> x^2, [1, 2, 3])  # result is [1, 4, 9]
println(result)
````

````
[1, 4, 9]

````

Here’s an example of passing an anonymous function to another function:

````julia
function apply_twice(f, x)
    return f(f(x))
end

result = apply_twice(x -> x + 1, 5)  # result is 7 (5 + 1 = 6, 6 + 1 = 7)
println(result)
````

````
7

````

## Documenting Functions

Documenting your functions makes your code more understandable. In Julia, you use docstrings, which are string literals placed before the function definition.

````julia
"""
    add(x, y)

Compute the sum of `x` and `y`

# Examples
```julia
julia> add(1, 2)
3
```
"""
function add(x, y)
    return x + y
end
````

````
Main.var"##260".add
````

In an interactive environment like the REPL or a Jupyter notebook, you can view this documentation by typing `?add`.

That concludes our lesson on functions in Julia! You now have the tools to define, use, and document functions effectively.

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

