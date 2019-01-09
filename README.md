# GithubAction for Psalm

## Usage

You can use it as a Github Action like this:

_.github/main.workflow_
```
workflow "Main" {
  on = "push"
  resolves = ["Psalm"]
}

action "Psalm" {
  uses = "docker://mickaelandrieu/psalm-ga"
  secrets = ["GITHUB_TOKEN"]
}
```

_to add specific arguments:_
```diff
workflow "Main" {
  on = "push"
  resolves = ["Psalm"]
}

action "Psalm" {
  uses = "docker://mickaelandrieu/psalm-ga"
  secrets = ["GITHUB_TOKEN"]
+  args = "--find-dead-code --threads=8 --diff --diff-methods"
}
```

**You can copy/paste the .github folder (under examples/) to your project and thats all!**

## Docker

A Docker-Image is built automatically and located here:
https://cloud.docker.com/u/mickaelandrieu/repository/docker/mickaelandrieu/psalm-ga

You can run it in any given directory like this:

`docker run --rm -it -w=/app -v ${PWD}:/app mickaelandrieu/psalm-ga:latest`
