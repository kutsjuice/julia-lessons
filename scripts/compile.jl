using Literate

@__DIR__

noexecute = [
    "3_try-catch.jl"
    # "1_functions.jl"
]

for dir in readdir((@__DIR__)*"\\..\\src", join=true)
    println(dir)
    isdir(dir) || continue
    for file in readdir(dir)
        splitext(file)[2] == ".jl" || continue
        println(splitpath(dir)[end])
        ifexec = !(file in noexecute)
        Literate.markdown(dir*"\\"*file, "compiled/"*(splitpath(dir)[end]); execute=ifexec, documenter=false)
        # println(file)
    end
end
