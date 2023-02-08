module VolumetricImageViewer


using GLMakie
using FileIO, ImageIO

include("sliceViewer.jl")
include("orthosliceViewer.jl")
include("obliqueslice.jl")

export sliceViewer,
    orthosliceViewer,
    obliqueslice

end # module VolumetricImageViewer
