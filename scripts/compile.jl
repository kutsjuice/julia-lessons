using Literate

@__DIR__
for dir in readdir((@__DIR__)*"\\..\\src", join=true)
    println(dir)
    isdir(dir) || continue
    for file in readdir(dir)
        splitext(file)[2] == ".jl" || continue
        Literate.markdown(dir*"\\"*file, "compiled/lesson_2"; execute=true, documenter=false)
        println(file)
    end
end
