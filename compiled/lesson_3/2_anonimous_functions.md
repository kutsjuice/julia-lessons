# Anonymous Functions and Closures in Julia

In this lesson, we'll explore anonymous functions and closures in Julia. These concepts are essential for writing concise and flexible code, especially in functional programming.

## Basic Syntax for Anonymous Functions

Anonymous functions are created with the `->` syntax and are great for quick tasks.

Simple example: doubling a number

````julia
(x -> x * 2)(4)  # returns 8
````

````
8
````

Multiple arguments

````julia
(x, y) -> x - y
````

````
#3 (generic function with 1 method)
````

Using a block for more complex logic

````julia
x -> begin
    y = x + 3
    y^2
end
````

````
#5 (generic function with 1 method)
````

## Typical Use Cases

Anonymous functions shine with higher-order functions like `map`, `filter`, and `sort`.

### Map

````julia
numbers = [1, 2, 3, 4]
doubled = map(x -> x * 2, numbers)  # [2, 4, 6, 8]
println(doubled)
````

````
[2, 4, 6, 8]

````

### Filter

````julia
odds = filter(x -> x % 2 != 0, numbers)  # [1, 3]
println(odds)
````

````
[1, 3]

````

### Sort

````julia
fruits = ["kiwi", "apple", "orange"]
sorted_by_last = sort(fruits, by = x -> x[end])  # ["apple", "kiwi", "orange"]
println(sorted_by_last)
````

````
["apple", "orange", "kiwi"]

````

## Assigning to a Variable

You can store an anonymous function in a variable for reuse.

````julia
triple = x -> x * 3
result = triple(6)  # 18
println(result)
````

````
18

````

## Closures

Closures capture variables from their outer scope, retaining them even after the outer function finishes.

### Returning a Function

````julia
function make_subtractor(n)
    return x -> x - n
end

sub3 = make_subtractor(3)
result = sub3(10)  # 7
println(result)
````

````
7

````

### What Is Captured?

````julia
function create_counter()
    count = 0
    return () -> count += 1
end

counter = create_counter()
println(counter())  # 1
println(counter())  # 2
````

````
1
2

````

## Additional Topics

Here are a few more useful concepts.

### Named Arguments in Anonymous Functions

````julia
((x; scale = 1) -> x * scale)(5; scale = 2)  # 10
````

````
10
````

### Recursive Anonymous Functions

````julia
factorial = x -> x <= 1 ? 1 : x * factorial(x - 1)
result = factorial(5)  # 120
println(result)
````

````
120

````

## Conclusion

Anonymous functions and closures are key tools in Julia for concise and expressive coding. Try these examples in your own projects!

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

