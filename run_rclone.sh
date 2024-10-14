#!/bin/bash

# Run rclone sync
## :sftp: uses generic SFTP backend. We just supply the host, user, pass, and port via flags.
## gcscon: uses the GCS backend that we defined in the rclone.conf config file. This is the only way I could get it to work.
## gcs-bucket-policy-only is needed when uniform access control on a bucket is enabled compared to ACLs. Otherwise this may need to be changed.
rclone sync -vv ":sftp:${SFTP_PATH}" "gcscon:${GCS_BUCKET}${GCS_PATH}" \
    --sftp-host=${SFTP_HOST} \
    --sftp-user=${SFTP_USERNAME} \
    --sftp-pass=$(rclone obscure "${SFTP_PASSWORD}") \
    --sftp-port=${SFTP_PORT} \
    --gcs-bucket-policy-only \

# Run rclone copy
## Use this instead if you want to copy files from the SFTP server to GCS, without deleting any files in the destination to match the source SFTP server.
## So you would comment out the above and uncomment the below.
# rclone copy -vv ":sftp:${SFTP_PATH}" "gcscon:${GCS_BUCKET}${GCS_PATH}" \
#     --sftp-host=${SFTP_HOST} \
#     --sftp-user=${SFTP_USERNAME} \
#     --sftp-pass=$(rclone obscure "${SFTP_PASSWORD}") \
#     --sftp-port=${SFTP_PORT} \
#     --gcs-bucket-policy-only \