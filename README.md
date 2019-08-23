# GithubAction for Psalm

## Usage

You can use it as a Github Action like this:

_.github/main.workflow_
```
on: [push]
	name: Test
	jobs:
	    psalm:
	        name: Psalm
	        runs-on: ubuntu-latest
	        steps:
	            - uses: actions/checkout@master
	            - name: psalm
	              uses: docker://mickaelandrieu/psalm-ga
```

_to add specific arguments:_
```diff
on: [push]
	name: Test
	jobs:
	    roave_bc_check:
	        name: Roave BC Check
	        runs-on: ubuntu-latest
	        steps:
	            - uses: actions/checkout@master
	            - name: Roave BC Check
	              uses: docker://mickaelandrieu/psalm-ga
+                     with:
+                       args: "--find-dead-code --threads=8 --diff --diff-methods"
}
```

**You can copy/paste the .github folder (under examples/) to your project and thats all!**

## Docker

A Docker-Image is built automatically and located here:
https://cloud.docker.com/u/mickaelandrieu/repository/docker/mickaelandrieu/psalm-ga

You can run it in any given directory like this:

`docker run --rm -it -w=/app -v ${PWD}:/app mickaelandrieu/psalm-ga:latest`
