"""
points are in 3 x n matrix
"""
function applyT(T::Matrix{FT1}, points::Matrix{FT2}
    ) where {FT1<:AbstractFloat, FT2<:AbstractFloat}
    return T[1:3, 1:3] * points .+ reshape(T[1:3, 4], (3, 1))
end

"""
points are in 3 x n matrix
function applyT!(T::Matrix{FT}, points::Matrix{FT})
"""
function applyT!(
    T::Matrix{FT1},
    points::Matrix{FT2}
) where {FT1<:AbstractFloat, FT2<:AbstractFloat}
    points .= T[1:3, 1:3] * points .+ reshape(T[1:3, 4], (3, 1))
end

function applyT(T::Matrix{Float64}, point::GeometryTypes.Point3f0)
    return GeometryTypes.Point3f0(T[1:3, 1:3] * point + T[1:3, 4])
end

function applyT(T::Matrix{Float64}, points::Vector{GeometryTypes.Point3f0})
    res = map(pt->applyT(T, pt), points)
    return res
end
