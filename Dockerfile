FROM alpine:3.20

WORKDIR /root

# Install curl, bash, and coreutils
RUN apk add --no-cache curl bash coreutils rclone

# Make sure md5sum is on the path
ENV PATH="/bin/md5sum:$PATH" 

# Move the rclone config file to the correct location
COPY rclone.conf /root/.config/rclone/rclone.conf

# Copy the run_rclone.sh script to the root of the container
COPY run_rclone.sh /root/run-rclone.sh

# Make the script executable
RUN chmod +x /root/run-rclone.sh

# Set the entry point to run the script
ENTRYPOINT ["/root/run-rclone.sh"]