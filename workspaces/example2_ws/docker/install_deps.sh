# Do not run this script.
# It is automatically loaded and run by the Dockerfile.


# Update and install required packages
apt update && apt install -y \
    ros-${ROS2_DISTRO}-navigation2 \
    ros-${ROS2_DISTRO}-nav2-bringup
