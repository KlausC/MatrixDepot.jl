
#download from remote site
import MatrixDepot: URL_REDIRECT, load, loadinfo, loadsvd

# test only for julia nightly on macos or if local
function do_test_remote()
    (length(VERSION.prerelease) > 0 && Sys.isapple()) ||
    !occursin("travis", Sys.BINDIR)
end

if !do_test_remote()
    println("remote tests not executed")
else
    URL_REDIRECT[] = 0
    # sp
    pattern = "*/494_bus" # which has not been touched in other tests
    @test loadinfo(pattern) == 1 # load only header
    @test loadsvd(pattern) == 1 # load svd extension data
    @test load(pattern) == 1 # loaded full data

    # Matrix Market
    pattern = "*/*/494_bus" # which has not been touched in other tests
    @test loadinfo(pattern) == 1 # load only header
    @test load(pattern) == 1 # loaded full data
    @test loadsvd(pattern) == 0 # not available
end
