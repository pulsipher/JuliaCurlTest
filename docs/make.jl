using Documenter

# Make the documentation via Documenter.jl
makedocs(;
    pages = ["Home" => "index.md"],
    authors = "Joshua Pulsipher",
    linkcheck = true,
    format = Documenter.HTML()
)
