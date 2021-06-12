# JuliaCurlTest

This is to help debug why `curl` fails sometimes when invoked from Julia on GitHub Actions 
with `ubuntu-latest`. This follows from https://discourse.julialang.org/t/link-checking-with-github-actions-not-working/61823/4.

Answer: Importing [Ipopt.jl](https://github.com/jump-dev/Ipopt.jl) causes the error: 
```
curl: /opt/hostedtoolcache/julia/1.6.1/x64/bin/../lib/julia/libcurl.so.4: no version information available (required by curl)
```
when the `curl` command is invoked from Julia in the same session (see the 
[run](https://github.com/pulsipher/JuliaCurlTest/runs/2810002251?check_suite_focus=true)). 
This occurs because of different `libcurl.so.x.x.x` versions (one already installed and one 
introduced by Julia):
```
/opt/hostedtoolcache/julia/1.6.1/x64/lib/julia/libcurl.so.4
/opt/hostedtoolcache/julia/1.6.1/x64/lib/julia/libcurl.so.4.7.0
/usr/lib/x86_64-linux-gnu/libcurl.so.4
/usr/lib/x86_64-linux-gnu/libcurl.so.4.6.0
/usr/local/julia1.6.1/lib/julia/libcurl.so.4
/usr/local/julia1.6.1/lib/julia/libcurl.so.4.7.0
```
This isn't a problem in and of itself, but it appears that Ipopt.jl uses `LD_LIBRARY_PATH` 
which induces the weird error behavior. See https://github.com/jump-dev/Ipopt.jl/blob/5cbb08da95ddae85cb501e648aac20da97a32be1/src/Ipopt.jl#L98-L106

This problem is manifest when using `linkcheck= true` on Documenter.jl builds that import 
`Ipopt.jl` in the examples. It probably also applies to other programs in addition to `curl`.
