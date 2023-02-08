
function sliceViewer(img3d::Array)
    if ndims(img3d) != 3
        error("It can only display 3D array")
    end
    fig = Figure()
    sgrid = SliderGrid(
        fig[2,1],
        (label = "xy plane - z axis", range = 1:size(img3d,3))
    )

    sl_z = sgrid.sliders[1]
    img_xy = lift(sl_z.value) do z
        view(img3d, :, :, z)
    end
    heatmap(fig[1,1], img_xy)
    fig
end


function sliceViewer(filename::AbstractString)
    if !isfile(filename)
        error("The file name should be valid")
    end
    img3d = load(filename)
    sliceViewer(img3d)
end