try
    run(`curl -sI https://google.com/`)
catch err
    println("Curl errored with: ", err)
end
