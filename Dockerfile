FROM alpine:latest

WORKDIR /root

# Install curl, bash, and coreutils
RUN apk add --no-cache curl bash coreutils rclone

# Make sure md5sum is on the path
ENV PATH="/bin/md5sum:$PATH" 

# Create the rclone config
RUN mkdir -p /root/.config/rclone && \
    echo "[gcstest]" > /root/.config/rclone/rclone.conf && \
    echo "type = google cloud storage" >> /root/.config/rclone/rclone.conf && \
    echo "env_auth = true" >> /root/.config/rclone/rclone.conf && \
    echo "" >> /root/.config/rclone/rclone.conf

# Copy the run_rclone.sh script to the root of the container
COPY run_rclone.sh /root/run-rclone.sh

# Make the script executable
RUN chmod +x /root/run-rclone.sh

# Set the entry point to run the script
ENTRYPOINT ["/root/run-rclone.sh"]