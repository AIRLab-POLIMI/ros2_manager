#!/bin/bash


# Exit script on any error
set -e

# One-time commands
if [ ! -f /tmp/ros2_workspaces/initialized ]; then
    
    # Source ROS 2 workspace
    echo "source ${ROS2_WS_PATH}/install/setup.bash" >> /home/${USER_NAME}/.bashrc
    
    # Create a flag file to indicate that this script has been already run
    touch /tmp/ros2_workspaces/initialized

fi

# Open an interactive bash shell
exec /bin/bash
