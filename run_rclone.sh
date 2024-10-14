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