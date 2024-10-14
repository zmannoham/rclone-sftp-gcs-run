# rclone-sftp-gcs-run

This repository provides a setup to deploy rclone with SFTP and Google Cloud Storage (GCS) integration.

## Deployment

You can deploy using either Cloud Shell or locally (only if you have the gcloud SDK installed).

1. Clone the repository:
    ```sh
    git clone https://github.com/zmannoham/rclone-sftp-gcs-run.git
    cd rclone-sftp-gcs-run
    ```

2. Edit the "substitutions" in cloudbuild.yaml to match your use case.
- Will need to have the following enabled:
  - Artifact Registry
  - Cloud Build
  - Cloud Run (for a Cloud Run Job)
- You will also:
  - Need a created Docker Repository in Artifact Registry.
- If you can't use generic default service accounts to run the Cloud Run Job or for Cloud Build:
  - Make sure to have a custom Cloud Build service account set up for this process.
  - Make sure to have a Cloud Run service account with permissions to edit objects in a specified bucket at least.
  - Supply these service accounts in the "substitutions" section in the cloudbuild.yaml file (may need to uncomment flag for service account in the last step of Cloud Build)

3. Decide if you'd like 'rclone sync' (default) or 'rclone copy'.
- Sync will delete files in the destination to match the source if used. This is useful if you want to exactly mirror what is in the SFTP server path with the Google Cloud Storage bucket path.
- Copy will copy files from the source SFTP server to the destination GCS bucket and path if the file doesn't exist in the destination, or if the file has been modified in the source. It will not delete files in the destination to match source.
- To switch to copy (if you'd like to copy), comment out the entire rclone sync command in run_rclone.sh and uncomment the entire rclone copy command in run_rclone.sh

4. Submit the build:
    ```sh
    gcloud builds submit .
    ```

## Customization

Ensure to customize the substitutions in `cloudbuild.yaml` to fit your specific use case.

The sftp server listed here is a public read-only sftp server with super basic credentials that I found online. I did not leak anything.

