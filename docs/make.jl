using Documenter, InfiniteOpt, Distributions, Random, Ipopt

# Make the documentation via Documenter.jl
makedocs(;
    pages = ["Home" => "index.md"],
    authors = "Joshua Pulsipher",
    linkcheck = true,
    sitename = "JuliaCurlTest",
    format = Documenter.HTML()
)