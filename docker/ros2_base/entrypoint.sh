#!/bin/bash


# Exit script on any error
set -e

# One-time commands
if [ ! -f /tmp/ros2_base/initialized ]; then

    # Source ROS 2 installation
    echo "source /opt/ros/${ROS2_DISTRO}/local_setup.bash" >> /home/${USER_NAME}/.bashrc

    # Enable ROS 2 colorized logging
    echo "export RCUTILS_COLORIZED_OUTPUT=1" >> /home/${USER_NAME}/.bashrc

    # Use NVIDIA GPU for rendering
    echo "export __NV_PRIME_RENDER_OFFLOAD=1" >> /home/${USER_NAME}/.bashrc
    echo "export __GLX_VENDOR_LIBRARY_NAME=nvidia" >> /home/${USER_NAME}/.bashrc

    # Create a flag file to indicate that this script has been already run
    touch /tmp/ros2_base/initialized

fi

# Open an interactive bash shell
exec /bin/bash
