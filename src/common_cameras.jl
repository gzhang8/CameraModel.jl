
function KinectV1Cam(;depth_factor=1000.0, baseline=50/525.0)
    cam = RgbdCamParams(
        width=640,
        height=480,
        fx=525.0,
        fy=525.0,
        cx=319.5,
        cy=239.5,
        depth_factor=depth_factor,
        baseline=baseline
    )
    return cam
end

function Aug_ICL_NUIM_CamParam()
    res = KinectV1Cam(depth_factor=1000.0)
    return res
end


"""
TODO: note that TUM have different camera parameters for different sequences
This one is default from ROS bag.
The rule of thumb is to use
"""
function TumCamROS()
    fx = 525.0  # focal length x
    fy = 525.0  # focal length y
    cx = 319.5  # optical center x
    cy = 239.5  # optical center y
    w = 640
    h = 480
    bf = 40.0
    depth_factor = 5000.0
    return RgbdCamParams(
        fx=fx,
        fy=fy,
        cx=cx,
        cy=cy,
        width=w,
        height=h,
        baseline=bf/fx,
        depth_factor=depth_factor)
end
