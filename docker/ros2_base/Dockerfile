# Specify the ROS distribution to use
ARG ROS2_DISTRO=${ROS2_DISTRO}

# Use the publicly available ROS image (using ROS 2 Humble if not specified by the user)
FROM osrf/ros:${ROS2_DISTRO:-humble}-desktop

# Set the default shell to be used for "RUN" Docker commands
SHELL ["/bin/bash", "-c"]

# Avoid interactive dialogues
ENV DEBIAN_FRONTEND=noninteractive

# Specify the name of the user to be created
ARG USER_NAME="devuser"

# Build arguments passed to Docker when building the image
ARG UID
ARG GID

# Specify the ROS distribution to use (a second time, since after the FROM instruction all the build arguments are reset)
ARG ROS2_DISTRO=${ROS2_DISTRO}
ENV ROS2_DISTRO=${ROS2_DISTRO}

# Delete the "ubuntu" user introduced in recent Ubuntu releases, since it conflicts with the UID/GID we want to assign to the new user
# (source: https://bugs.launchpad.net/cloud-images/+bug/2005129)
RUN if [ "$ROS2_DISTRO" = "jazzy" ]; then \
        userdel -r ubuntu; \
    fi

# Create a new user with the same UID/GID as the host user, so that files created in the container have the right permissions to be modified in the host system
RUN groupadd --gid $GID $USER_NAME
RUN useradd --create-home --uid $UID --gid $USER_NAME $USER_NAME
ENV PATH="/home/$USER_NAME/.local/bin:${PATH}"

# Give sudo support to the new user
RUN usermod -aG sudo $USER_NAME
RUN echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Suppress initial sudo message
RUN touch /home/$USER_NAME/.sudo_as_admin_successful

# Prevent the "QStandardPaths: XDG_RUNTIME_DIR not set" from appearing when running some programs
ENV XDG_RUNTIME_DIR=/home/$USER_NAME/tmp_xdg_runtime

# Update and install basic utilities
RUN apt update && apt install -y \
    vim \
    xterm \
    evince \
    ros-${ROS2_DISTRO}-rmw-cyclonedds-cpp

# Copy the script into the container and make it executable
COPY entrypoint.sh /usr/local/bin/ros2_base_entrypoint.sh
RUN chmod +x /usr/local/bin/ros2_base_entrypoint.sh

# Switch to the non-root user
USER $USER_NAME

# Start the container in the home directory of the non-root user
WORKDIR /home/$USER_NAME

# Set the ENTRYPOINT
ENTRYPOINT ["/usr/local/bin/ros2_base_entrypoint.sh"]
