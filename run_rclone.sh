#!/bin/bash

# Run rclone sync
rclone sync -vv ":sftp:${SFTP_PATH}" "gcstest:${GCS_BUCKET}${GCS_PATH}" \
    --sftp-host=${SFTP_HOST} \
    --sftp-user=${SFTP_USERNAME} \
    --sftp-pass=$(rclone obscure "${SFTP_PASSWORD}") \
    --sftp-port=${SFTP_PORT} \
    --gcs-bucket-policy-only \