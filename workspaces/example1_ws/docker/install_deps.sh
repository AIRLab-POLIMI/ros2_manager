# Do not run this script.
# It is automatically loaded and run by the Dockerfile.


# Update and install required packages
apt update && apt install -y \
    ros-${ROS2_DISTRO}-moveit \
    ros-${ROS2_DISTRO}-ros2-control \
    ros-${ROS2_DISTRO}-ros2-controllers

