module CameraModel

import GeometryTypes

export AbstractCamParams, RgbdCamParams,

       KinectV1Cam, Aug_ICL_NUIM_CamParam, TumCamROS,

       applyT, applyT!

include("camera_params.jl")
include("common_cameras.jl")
include("rigid_transformation.jl")
end # module
