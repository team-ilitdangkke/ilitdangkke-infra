# Build Docker Image For Terraform
* Using Container with AWS Secret
    * Install Necessary Tools
        * Terraform
        * AWS CLI
        * Mongosh

```
docker build --build-arg AWS_ACCESS_KEY_ID=<your-access-key> --build-arg AWS_SECRET_ACCESS_KEY=<your-secret-key> -t aws-infra:<tag> -f docker/dockerfile --platform linux/amd64 .
docker run --rm -it -v $(pwd)/:/aws aws-infra:<tag>
```
