null_file = @static Sys.iswindows() ? "nul" : "/dev/null"
run(`curl -sI --proto =http,https,ftp,ftps https://jump.dev/JuMP.jl/v0.21.8/ --max-time 10 -o $(null_file) --write-out '%{http_code} %{url_effective} %{redirect_url}'`)
