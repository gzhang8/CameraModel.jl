
abstract type AbstractCamParams end


struct RgbdCamParams <: AbstractCamParams
    width::Int64
    height::Int64
    fx::Float64
    fy::Float64
    cx::Float64
    cy::Float64

    # virtual stereo baseline
    baseline::Float64
    depth_factor::Float64

    k1::Float64
    k2::Float64
    p1::Float64
    p2::Float64
    k3::Float64

    # for calculation
    invfx::Float64
    invfy::Float64
    # Stereo baseline multiplied by fx.
    bfx::Float64
end


function RgbdCamParams(;
    width::Int64,
    height::Int64,
    fx::Float64,
    fy::Float64,
    cx::Float64,
    cy::Float64,
    depth_factor::Float64,
    baseline::Float64=0.1,
    k1::Float64=0.0,
    k2::Float64=0.0,
    p1::Float64=0.0,
    p2::Float64=0.0,
    k3::Float64=0.0,
)
    invfx = 1/fx
    invfy = 1/fy

    bfx = baseline * fx

    cam = RgbdCamParams(
        width,
        height,
        fx,
        fy,
        cx,
        cy,
        baseline,
        depth_factor,
        k1,
        k2,
        p1,
        p2,
        k3,
        invfx,
        invfy,
        bfx,
    )
    return cam
end


# stereo camera

struct StereoCamParams <: AbstractCamParams
    width::Int64
    height::Int64
    fx::Float64
    fy::Float64
    cx::Float64
    cy::Float64

    # baseline in meter
    baseline::Float64

    k1::Float64
    k2::Float64
    p1::Float64
    p2::Float64
    k3::Float64

    # for calculation
    invfx::Float64
    invfy::Float64
    # Stereo baseline multiplied by fx.
    bfx::Float64
end


function StereoCamParams(;
    width::Int64,
    height::Int64,
    fx::Float64,
    fy::Float64,
    cx::Float64,
    cy::Float64,
    baseline::Float64=0.1,
    k1::Float64=0.0,
    k2::Float64=0.0,
    p1::Float64=0.0,
    p2::Float64=0.0,
    k3::Float64=0.0,
)
    invfx = 1/fx
    invfy = 1/fy

    bfx = baseline * fx

    cam = StereoCamParams(
        width,
        height,
        fx,
        fy,
        cx,
        cy,
        baseline,
        k1,
        k2,
        p1,
        p2,
        k3,
        invfx,
        invfy,
        bfx,
    )
    return cam
end
