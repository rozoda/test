#!/bin/bash

# Set the AWS region and ECR repository name
AWS_REGION="us-east-1"
ECR_REPO_NAME="446490546198"

# Set the Dockerfile name and Docker image name
DOCKERFILE_NAME="Dockerfile"
DOCKER_IMAGE_NAME="frontend"
DOCKER_IMAGE_TAG="latest"

# Build the Docker image
docker build -t $DOCKER_IMAGE_NAME -f $DOCKERFILE_NAME .

# Authenticate Docker with AWS ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO_NAME.dkr.ecr.$AWS_REGION.amazonaws.com

# Tag the Docker image for AWS ECR
# docker tag $DOCKER_IMAGE_NAME:latest $ECR_REPO_NAME.dkr.ecr.$AWS_REGION.amazonaws.com/$DOCKER_IMAGE_NAME:latest
docker tag $DOCKER_IMAGE_NAME:latest $ECR_REPO_NAME.dkr.ecr.$AWS_REGION.amazonaws.com/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG


# Push the Docker image to AWS ECR
# docker push $ECR_REPO_NAME.dkr.ecr.$AWS_REGION.amazonaws.com/$DOCKER_IMAGE_NAME:latest
docker push $ECR_REPO_NAME.dkr.ecr.$AWS_REGION.amazonaws.com/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG

# Remove the Docker image from local machine
docker rmi $DOCKER_IMAGE_NAME:latest
