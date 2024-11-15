#!/bin/bash


# Exit script on any error
set -e

# One-timme commands
if [ ! -f /tmp/initialized ]; then
    # Source ROS 2 installation
    echo "source /opt/ros/${ROS2_DISTRO}/local_setup.bash" >> /home/${USER_NAME}/.bashrc
    # Source the ROS 2 workspace
    echo "source ${ROS2_WS_PATH}/install/setup.bash" >> /home/${USER_NAME}/.bashrc
    # Enable ROS colorized logging
    echo "export RCUTILS_COLORIZED_OUTPUT=1" >> /home/${USER_NAME}/.bashrc
    # Create a flag file to indicate that this script has been already run
    touch /tmp/initialized
fi

# Open an interactive bash shell
exec /bin/bash
