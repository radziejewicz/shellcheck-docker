# Shellcheck Docker
Shellcheck is a static analysis tool for bash scripts: https://www.shellcheck.net

## Docker build

### 1. Build Docker container

```bash
docker build --rm -t aljandor/shellcheck-docker:latest .
```

### 2. Run Docker container
```bash
docker run --rm -it -v `pwd`:/scripts shl shellcheck /scripts/script.sh
```

### 3. Example usage in bitbucket-pipelines.yml

```yaml
pipelines:
  branches:
    master:    
      - step:        
          name: Run Shellcheck linter
          image: aljandor/shellcheck-docker:latest
          script:
            - shellcheck -V
            - find ./scripts -type f -name "*.sh" | sort -u | xargs shellcheck -e SC2034 --color=always
```

### 4. Example usage in GitLab CI
```yaml
shellcheck:
  stage: test
  image: aljandor/shellcheck-docker:latest
  only:
    changes:
      - "**/*.bash"
  before_script:
    - shellcheck -V
  script:
    - find ./scripts -type f -name "*.sh" | sort -u | xargs shellcheck -e SC2034 --color=always
  tags:
    - docker
```    

## CI/CD to Dockerhub
https://hub.docker.com/repository/docker/aljandor/shellcheck-docker

Dockerhub is integrated with the repository, it automatically starts the build image from the master branch: `aljandor/shellcheck-docker:latest`

## TODO
- tags for shellcheck version
- GitHub usage