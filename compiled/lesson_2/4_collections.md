# Data Collections in Julia: Tuples, Arrays, Dicts, and Sets

In programming, we often need to work with collections of data. Julia provides a rich set of data structures to efficiently organize and manipulate data. This lesson will introduce you to some of the fundamental data collections in Julia: **Tuples**, **Arrays**, **Dictionaries (Dicts)**, and **Sets**. We will explore their properties, how to create and use them, and when to choose one over another. We will focus on basic operations, excluding linear algebra for Arrays in this lesson.

## 1. Tuples: Immutable Ordered Collections

Tuples are ordered collections of items, similar to lists in other languages, but with a key difference: **tuples are immutable**. Once a tuple is created, you cannot change its contents. Tuples are defined using parentheses `()` and comma-separated elements.

### Creating Tuples

````julia
# Creating a tuple with different data types
my_tuple = (1, "hello", 3.14, true)
println(my_tuple)

# Tuple with only one element (note the trailing comma)
single_element_tuple = (5,)
println(single_element_tuple)

# Empty tuple
empty_tuple = ()
println(empty_tuple)
````

````
(1, "hello", 3.14, true)
(5,)
()

````

### Accessing Tuple Elements

You can access elements in a tuple using indexing, just like strings and arrays. Julia uses 1-based indexing, meaning the first element is at index 1.

````julia
example_tuple = ("apple", "banana", "cherry")

# Accessing the first element
first_element = example_tuple[1]
println("First element: ", first_element)

# Accessing the third element
third_element = example_tuple[3]
println("Third element: ", third_element)

# You can also use negative indexing to access from the end
last_element = example_tuple[end] # or example_tuple[-1]
println("Last element: ", last_element)
````

````
First element: apple
Third element: cherry
Last element: cherry

````

### Immutability of Tuples

Let's demonstrate that tuples are immutable. If you try to modify a tuple, you will get an error.

````julia
immutable_tuple = (10, 20, 30)

# Attempting to change the first element (will cause an error)
# immutable_tuple[1] = 15  # Uncommenting this line will throw an error

# Instead of modifying, you can create a new tuple based on the old one
new_tuple = (15, immutable_tuple[2], immutable_tuple[3])
println("Original tuple: ", immutable_tuple)
println("New tuple: ", new_tuple)
````

````
Original tuple: (10, 20, 30)
New tuple: (15, 20, 30)

````

### Use Cases for Tuples

Tuples are useful when you need:
- To return multiple values from a function.
- To represent fixed collections of items where the order and values are important and should not be changed.
- As keys in dictionaries (since keys must be immutable).

## 1.1. Named Tuples: Tuples with Named Fields

Julia also provides **named tuples**, which are a variation of tuples where each element is given a name. This makes the tuple elements more self-descriptive and can improve code readability, especially when dealing with structured data.  Named tuples are also immutable, just like regular tuples.

### Creating Named Tuples

Named tuples are created using parentheses `()` and assigning names to each element using the syntax `name = value`, with elements separated by commas.

Creating a named tuple

````julia
person_named_tuple = (name = "Alice", age = 30, city = "New York")
println(person_named_tuple)
````

````
(name = "Alice", age = 30, city = "New York")

````

Another way to create a named tuple using the keyword constructor

````julia
another_named_tuple = (; fruit = "apple", color = "red")
println(another_named_tuple)
````

````
(fruit = "apple", color = "red")

````

You can also create named tuples with mixed data types, like regular tuples

````julia
mixed_named_tuple = (id = 123, label = "Data Point", value = 2.71)
println(mixed_named_tuple)
````

````
(id = 123, label = "Data Point", value = 2.71)

````

### Accessing Elements in Named Tuples

You can access elements in a named tuple in a few ways:

1.  **By name using dot (`.`) syntax**: This is the most common and readable way to access elements in a named tuple.
2.  **By name as a symbol in square brackets `[]`**: Similar to accessing dictionary values by key.
3.  **By index in square brackets `[]`**: Just like regular tuples, using numerical indices.

````julia
example_named_tuple = (product = "Laptop", price = 1200.50, in_stock = true)
````

````
(product = "Laptop", price = 1200.5, in_stock = true)
````

Accessing by name using dot syntax

````julia
product_name = example_named_tuple.product
println("Product name: ", product_name)

product_price = example_named_tuple.price
println("Product price: ", product_price)
````

````
Product name: Laptop
Product price: 1200.5

````

Accessing by name as a symbol in square brackets

````julia
stock_status = example_named_tuple[:in_stock]
println("In stock: ", stock_status)
````

````
In stock: true

````

Accessing by index (like regular tuples)

````julia
first_item = example_named_tuple[1]
println("First item (by index): ", first_item) # Note: this will be the *value*, not the name.

second_item = example_named_tuple[2]
println("Second item (by index): ", second_item)
````

````
First item (by index): Laptop
Second item (by index): 1200.5

````

### Immutability of Named Tuples

Named tuples are also immutable. You cannot change the value of a field in a named tuple after it's created.

````julia
immutable_named_tuple = (x = 5, y = 10)
````

````
(x = 5, y = 10)
````

Attempting to modify a field (will cause an error)
immutable_named_tuple.x = 7  # Uncommenting this line will throw an error

To change a value, create a new named tuple

````julia
new_named_tuple = (x = 7, y = immutable_named_tuple.y)
println("Original named tuple: ", immutable_named_tuple)
println("New named tuple: ", new_named_tuple)
````

````
Original named tuple: (x = 5, y = 10)
New named tuple: (x = 7, y = 10)

````

### Use Cases for Named Tuples

Named tuples are particularly useful in scenarios where you want to work with structured data in a clear and self-documenting way:

- **Returning structured data from functions:** When a function needs to return multiple related values, using a named tuple makes the return value more meaningful and easier to understand.
- **Representing records or data entries:** Named tuples can represent rows of data, where each field has a name (e.g., a record from a CSV file or a database).
- **Options and configurations:**  For passing configuration options to functions, named tuples can improve readability compared to just passing positional arguments.
- **Improving code readability:** When you access elements by name (using dot syntax), it becomes immediately clear what each value represents, making the code easier to read and maintain.

Let's see an example of using a named tuple to return structured data from a function:

````julia
function get_circle_properties(radius)
    area = pi * radius^2
    circumference = 2 * pi * radius
    return (area = area, circumference = circumference) # Returning a named tuple
end

circle_props = get_circle_properties(5)
println("Circle properties for radius 5:")
println("- Area: ", circle_props.area)
println("- Circumference: ", circle_props.circumference)
````

````
Circle properties for radius 5:
- Area: 78.53981633974483
- Circumference: 31.41592653589793

````

In this example, using a named tuple makes it very clear what the function `get_circle_properties` returns – an object with `area` and `circumference` fields, making the code more understandable and maintainable compared to returning a regular tuple where you would have to remember the order of the returned values.

## 2. Arrays: Mutable Ordered Collections

Arrays in Julia are mutable, ordered collections of items. They are similar to lists in Python or arrays in JavaScript. Arrays are defined using square brackets `[]` and comma-separated elements.  In this lesson, we will focus on 1-dimensional arrays and basic operations, excluding linear algebra aspects.

### Creating Arrays

````julia
# Creating an array of numbers
number_array = [1, 2, 3, 4, 5]
println(number_array)

# Array of strings
string_array = ["cat", "dog", "bird"]
println(string_array)

# Array with mixed data types
mixed_array = [10, "text", true, 2.5]
println(mixed_array)

# Creating an empty array (you can specify the data type if needed, e.g., Int64[])
empty_array = []
println(empty_array)
````

````
[1, 2, 3, 4, 5]
["cat", "dog", "bird"]
Any[10, "text", true, 2.5]
Any[]

````

### Accessing and Modifying Array Elements

Arrays are mutable, so you can change their elements after creation. You access and modify elements using indexing.

````julia
fruit_array = ["apple", "banana", "cherry"]

# Accessing the second element
second_fruit = fruit_array[2]
println("Second fruit: ", second_fruit)

# Modifying the first element
fruit_array[1] = "apricot"
println("Modified array: ", fruit_array)

# You can also use end to refer to the last index and modify it
fruit_array[end] = "cranberry"
println("Modified last element: ", fruit_array)
````

````
Second fruit: banana
Modified array: ["apricot", "banana", "cherry"]
Modified last element: ["apricot", "banana", "cranberry"]

````

### Basic Array Operations (Non-Linear Algebra)

Julia provides several functions to manipulate arrays without using linear algebra:

*   **`push!()`**: Adds an element to the end of an array.
*   **`pop!()`**: Removes and returns the last element from an array.
*   **`append!()`**: Adds elements from another array to the end of the first array.
*   **`prepend!()`**: Adds elements at the beginning of an array.
*   **`insert!()`**: Inserts an element at a specific index.
*   **`deleteat!()`**: Deletes an element at a specific index.

````julia
mutable_array = [100, 200, 300]
println("Initial array: ", mutable_array)

# push!(): Add an element to the end
push!(mutable_array, 400)
println("After push!(400): ", mutable_array)

# pop!(): Remove and return the last element
popped_element = pop!(mutable_array)
println("Popped element: ", popped_element)
println("Array after pop!(): ", mutable_array)

# append!(): Add elements from another array
append!(mutable_array, [500, 600])
println("After append!([500, 600]): ", mutable_array)

# prepend!(): Add elements at the beginning
prepend!(mutable_array, [50, 60])
println("After prepend!([50, 60]): ", mutable_array)

# insert!(): Insert element at a specific index (index 3)
insert!(mutable_array, 3, 70)
println("After insert!(3, 70): ", mutable_array)

# deleteat!(): Delete element at a specific index (index 4)
deleted_element = deleteat!(mutable_array, 4)
println("Deleted element at index 4: ", deleted_element)
println("Array after deleteat!(4): ", mutable_array)
````

````
Initial array: [100, 200, 300]
After push!(400): [100, 200, 300, 400]
Popped element: 400
Array after pop!(): [100, 200, 300]
After append!([500, 600]): [100, 200, 300, 500, 600]
After prepend!([50, 60]): [50, 60, 100, 200, 300, 500, 600]
After insert!(3, 70): [50, 60, 70, 100, 200, 300, 500, 600]
Deleted element at index 4: [50, 60, 70, 200, 300, 500, 600]
Array after deleteat!(4): [50, 60, 70, 200, 300, 500, 600]

````

### Use Cases for Arrays

Arrays are extremely versatile and used in many situations:
- Storing lists of items where order matters and the collection may need to change (grow or shrink).
- Implementing dynamic lists, stacks, queues, and other data structures.
- Representing sequences of data for iteration and processing.

## 3. Dictionaries (Dicts): Key-Value Pairs

Dictionaries (or Dicts in Julia) are collections of key-value pairs. Each key in a dictionary is unique and is used to access its corresponding value. Dictionaries are mutable and are very efficient for looking up values based on keys.

### Creating Dictionaries

````julia
# Creating a dictionary using Dict() constructor and => operator
person_dict = Dict("name" => "Alice", "age" => 30, "city" => "New York")
println(person_dict)

# Another way to create a dictionary
another_dict = ["a" => 1, "b" => 2, "c" => 3] # This also creates a Dict
println(another_dict)

# Creating an empty dictionary
empty_dict = Dict()
println(empty_dict)
````

````
Dict{String, Any}("name" => "Alice", "city" => "New York", "age" => 30)
["a" => 1, "b" => 2, "c" => 3]
Dict{Any, Any}()

````

### Accessing and Modifying Dictionary Values

You access values in a dictionary using their keys within square brackets. You can also modify values associated with existing keys or add new key-value pairs.

````julia
student_grades = Dict("Alice" => 85, "Bob" => 92, "Charlie" => 78)

# Accessing value by key
alice_grade = student_grades["Alice"]
println("Alice's grade: ", alice_grade)

# Modifying value for a key
student_grades["Bob"] = 95
println("Updated grades: ", student_grades)

# Adding a new key-value pair
student_grades["David"] = 88
println("Grades with David: ", student_grades)

# Using get() to access with a default value if key doesn't exist
john_grade = get(student_grades, "John", 0) # Returns 0 if "John" not found
println("John's grade (using get with default): ", john_grade)

# Using get!() to access or set a default value if key doesn't exist
jane_grade = get!(student_grades, "Jane", 75) # Sets "Jane" to 75 if not found, then returns 75
println("Jane's grade (using get! and set default): ", jane_grade)
println("Grades after get! for Jane: ", student_grades)
````

````
Alice's grade: 85
Updated grades: Dict("Alice" => 85, "Charlie" => 78, "Bob" => 95)
Grades with David: Dict("Alice" => 85, "David" => 88, "Charlie" => 78, "Bob" => 95)
John's grade (using get with default): 0
Jane's grade (using get! and set default): 75
Grades after get! for Jane: Dict("Alice" => 85, "David" => 88, "Charlie" => 78, "Bob" => 95, "Jane" => 75)

````

### Checking for Keys and Removing Key-Value Pairs

*   **`haskey()`**: Checks if a dictionary contains a specific key.
*   **`delete!()`**: Removes a key-value pair from a dictionary based on the key.
*   **`pop!()`**: Removes and returns the value associated with a key (and removes the key-value pair).

````julia
inventory = Dict("apples" => 50, "bananas" => 100, "oranges" => 75)

# haskey(): Check if key exists
has_apples = haskey(inventory, "apples")
println("Does inventory have apples? ", has_apples)
has_grapes = haskey(inventory, "grapes")
println("Does inventory have grapes? ", has_grapes)

# delete!(): Remove a key-value pair
delete!(inventory, "bananas")
println("Inventory after delete!(\"bananas\"): ", inventory)

# pop!(): Remove and return value for a key
orange_count = pop!(inventory, "oranges")
println("Popped orange count: ", orange_count)
println("Inventory after pop!(\"oranges\"): ", inventory)

# pop! with default value if key is not found
grape_count = pop!(inventory, "grapes", 0) # Returns 0 because "grapes" is not a key
println("Popped grape count (default 0): ", grape_count)
````

````
Does inventory have apples? true
Does inventory have grapes? false
Inventory after delete!("bananas"): Dict("oranges" => 75, "apples" => 50)
Popped orange count: 75
Inventory after pop!("oranges"): Dict("apples" => 50)
Popped grape count (default 0): 0

````

### Iterating Through Dictionaries

You can iterate over dictionaries to access keys and values.

````julia
country_capitals = Dict("USA" => "Washington D.C.", "Canada" => "Ottawa", "Japan" => "Tokyo")

# Iterating over key-value pairs
println("Capitals:")
for (country, capital) in country_capitals
    println("- The capital of ", country, " is ", capital)
end

# Iterating over keys only
println("\nCountries:")
for country in keys(country_capitals)
    println("- ", country)
end

# Iterating over values only
println("\nCapitals Names:")
for capital in values(country_capitals)
    println("- ", capital)
end
````

````
Capitals:
- The capital of USA is Washington D.C.
- The capital of Canada is Ottawa
- The capital of Japan is Tokyo

Countries:
- USA
- Canada
- Japan

Capitals Names:
- Washington D.C.
- Ottawa
- Tokyo

````

### Use Cases for Dictionaries

Dictionaries are excellent for:
- Representing data where you need to look up values quickly using unique keys (like words and their definitions, usernames and user profiles).
- Storing configuration settings as key-value pairs.
- Counting the frequency of items.
- Caching and memoization.

## 4. Sets: Unordered Collections of Unique Elements

Sets are unordered collections of unique elements. Sets are useful when you need to store a collection of items where only uniqueness matters, and the order is not important. Sets are mutable.

### Creating Sets

````julia
# Creating a set from an array
number_set = Set([1, 2, 2, 3, 4, 4, 4, 5]) # Duplicates are automatically removed
println(number_set)

# Creating an empty set
empty_set = Set()
println(empty_set)

# Adding elements to an empty set
push!(empty_set, 10)
push!(empty_set, 20)
push!(empty_set, 10) # Adding duplicate has no effect
println(empty_set)
````

````
Set([5, 4, 2, 3, 1])
Set{Any}()
Set(Any[20, 10])

````

### Basic Set Operations

*   **`push!()`**: Adds an element to a set (if it's not already present).
*   **`delete!()`**: Removes an element from a set.
*   **`in()`**: Checks if an element is in a set.
*   **`union()`**, **`intersect()`**, **`setdiff()`**: Perform set operations (union, intersection, difference).

````julia
my_set = Set([1, 2, 3, 4, 5])
println("Initial set: ", my_set)

# push!(): Add an element
push!(my_set, 6)
println("After push!(6): ", my_set)
push!(my_set, 3) # Adding existing element has no effect
println("After push!(3) - no effect: ", my_set)

# delete!(): Remove an element
delete!(my_set, 4)
println("After delete!(4): ", my_set)

# in(): Check for membership
is_in_set = 3 in my_set
println("Is 3 in the set? ", is_in_set)
is_in_set_2 = 4 in my_set
println("Is 4 in the set? ", is_in_set_2)

# Set operations
set1 = Set([1, 2, 3])
set2 = Set([3, 4, 5])

union_set = union(set1, set2)
println("Union of set1 and set2: ", union_set)

intersection_set = intersect(set1, set2)
println("Intersection of set1 and set2: ", intersection_set)

difference_set = setdiff(set1, set2) # Elements in set1 but not in set2
println("Difference (set1 - set2): ", difference_set)
````

````
Initial set: Set([5, 4, 2, 3, 1])
After push!(6): Set([5, 4, 6, 2, 3, 1])
After push!(3) - no effect: Set([5, 4, 6, 2, 3, 1])
After delete!(4): Set([5, 6, 2, 3, 1])
Is 3 in the set? true
Is 4 in the set? false
Union of set1 and set2: Set([5, 4, 2, 3, 1])
Intersection of set1 and set2: Set([3])
Difference (set1 - set2): Set([2, 1])

````

### Use Cases for Sets

Sets are ideal for:
- Membership testing (checking if an item belongs to a collection).
- Removing duplicate items from a collection.
- Performing set algebra operations like union, intersection, and difference.
- Situations where the uniqueness of elements is crucial, and order doesn't matter.

## Summary Table: Choosing the Right Collection

| Feature          | Tuple        | Array         | Dictionary (Dict) | Set           |
| ---------------- | ------------ | ------------- | ----------------- | ------------- |
| Mutability       | Immutable    | Mutable       | Mutable           | Mutable       |
| Ordering         | Ordered      | Ordered       | Unordered         | Unordered     |
| Element Access   | Index-based  | Index-based   | Key-based         | Value-based (membership test) |
| Key-Value Pairs  | No           | No            | Yes               | No            |
| Duplicates       | Allowed      | Allowed       | Keys: No, Values: Yes | Not Allowed   |
| Syntax           | `()`         | `[]`          | `Dict()` or `=>` | `Set()`       |
| Use Cases        | Fixed data, function returns | Lists, sequences, dynamic data | Key-value lookups, mappings | Uniqueness, membership testing |

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

