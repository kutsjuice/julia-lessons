using Literate

@__DIR__

noexecute = [
    "3_try-catch.jl"
]

for dir in readdir((@__DIR__)*"\\..\\src", join=true)
    println(dir)
    isdir(dir) || continue
    for file in readdir(dir)
        splitext(file)[2] == ".jl" || continue
        ifexec = !(file in noexecute)
        Literate.markdown(dir*"\\"*file, "compiled/lesson_2"; execute=ifexec, documenter=false)
        println(file)
    end
end
