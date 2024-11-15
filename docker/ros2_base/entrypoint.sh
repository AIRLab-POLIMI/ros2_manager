#!/bin/bash


# Exit script on any error
set -e

# One-timme commands
if [ ! -f /tmp/initialized ]; then
    # Source ROS 2 installation
    echo "source /opt/ros/${ROS2_DISTRO}/local_setup.bash" >> /home/${USER_NAME}/.bashrc
fi

# Open an interactive bash shell
exec /bin/bash
