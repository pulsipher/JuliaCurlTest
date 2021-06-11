using Pkg; Pkg.add("Ipopt"); using Iopot

null_file = @static Sys.iswindows() ? "nul" : "/dev/null"
run(`curl -sI --proto =http,https,ftp,ftps https://google.com/ --max-time 10 -o $(null_file) --write-out '%{http_code} %{url_effective} %{redirect_url}'`)
