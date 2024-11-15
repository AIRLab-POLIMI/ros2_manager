# ROS distribution to use
ARG ROS2_DISTRO=${ROS2_DISTRO}

# Start from the custom ROS 2 image previously built
FROM ros2_base_image:${ROS2_DISTRO}

# Specify the name of the user (must be the same as the one from the base image)
ARG USER_NAME=${USER_NAME}

# Specify the name of the workspace and the name of the project
ARG ROS2_WS_NAME=${ROS2_WS_NAME}
ARG PROJECT_NAME=${PROJECT_NAME}

# Switch to the root user
USER root

# Copy the install_deps.sh script into the container, make it executable, and execute it
COPY ./workspaces/${ROS2_WS_NAME}/docker/install_deps.sh /usr/local/bin/install_deps.sh
RUN chmod +x /usr/local/bin/install_deps.sh
RUN /usr/local/bin/install_deps.sh

# Copy the entrypoint.sh script into the container and make it executable
COPY ./docker/ros2_workspaces/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Switch to the non-root user
USER $USER_NAME

# Set the ENTRYPOINT
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
