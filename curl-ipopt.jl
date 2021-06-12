import Pkg; Pkg.add("Ipopt"); import Ipopt
try
    run(`curl -sI https://google.com/`)
catch err
    println("Curl errored with: ", err)
end
