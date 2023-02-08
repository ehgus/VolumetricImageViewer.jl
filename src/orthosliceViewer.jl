
"""
Provide similar functionality with the counterpart of matlab
"""
function orthosliceViewer(img3d::Array)
    if ndims(img3d) != 3
        error("It can only display 3D array")
    end
    fig = Figure()
    sgrid = SliderGrid(
        fig[2,2],
        (label = "yz plane - x axis", range = 1:size(img3d,1)),
        (label = "xz plane - y axis", range = 1:size(img3d,2)),
        (label = "xy plane - z axis", range = 1:size(img3d,3))
    )
    sl_x, sl_y, sl_z = sgrid.sliders
    img_yz = lift(sl_x.value) do x
        view(img3d, x, :, :)
    end
    img_xz = lift(sl_y.value) do y
        transpose(view(img3d, :, y, :))
    end
    img_xy = lift(sl_z.value) do z
        view(img3d, :, :, z)
    end
    heatmap(fig[1,1], img_xy)
    heatmap(fig[1,2], img_xz)
    heatmap(fig[2,1], img_yz)
    fig
end

function orthosliceViewer(filename::AbstractString)
    if !isfile(filename)
        error("The file name should be valid")
    end
    img3d = load(filename)
    orthosliceViewer(img3d)
end
