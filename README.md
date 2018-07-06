# docker-awscli
Docker container with aws cli and other useful tools for use in CI systems

# Usage

This container can be used either as a way to invoke aws cli with Docker, or as a CI image you can clone your repo into and utilize a handful of other helpers:

- bash
- jq
- jsonlit
- awscli

It assumes AWS keys are available in the usual manner:
- environment variables
- ec2 instance profile
- profile file (you will need to mount it to the proper location with something like `-v <path to profile>:/root/.aws/`)

## As a CI Container

For example, on GitLab CI you could do something like:

```yaml
variables:
  S3_BUCKET: some bucket

stages:
  - test
  - deploy

image: away-team/docker-awscli

lint:
  stage: test
  script:
    - find . -type f -name "*.json" -exec jsonlint {} \;

deploy:
  stage: deploy
  script:
    - aws s3 sync . s3://${S3_BUCKET}
```

## As a CLI tool

Since this container has a few uses it does not have a default command, you will need to invoke it like:

```sh
docker run away-team/docker-awscli aws <command>
```
