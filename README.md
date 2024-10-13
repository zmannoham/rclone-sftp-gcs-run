# rclone-sftp-gcs-run

This repository provides a setup to deploy rclone with SFTP and Google Cloud Storage (GCS) integration.

## Deployment

You can deploy using either Cloud Shell or locally (only if you have the gcloud SDK installed).

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/rclone-sftp-gcs-run.git
    cd rclone-sftp-gcs-run
    ```

2. Edit the "substitutions" in cloudbuild.yaml to match your use case.
- Make sure you have Artifact Registry enabled and have created a Docker repository
- Also will need to have Cloud Build enabled.


3. Submit the build:
    ```sh
    gcloud builds submit .
    ```

## Customization

Ensure to customize the substitutions in `cloudbuild.yaml` to fit your specific use case.

The sftp server listed here is a public read-only sftp server with super basic credentials that I found online. I did not leak anything.

