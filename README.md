# Pa11y Dashboard Test Repo

> **Warning**
> The work done within this repo are proof of concept and should be used as a starting point for future work.

[![Builds Nodejs Container with Mongodb](https://github.com/nateprice18f/container-pa11y-test/actions/workflows/container-build.yml/badge.svg)](https://github.com/nateprice18f/container-pa11y-test/actions/workflows/container-build.yml) 
[![Pa11y Dashboard Container](https://github.com/nateprice18f/container-pa11y-test/actions/workflows/cotainer-pa11y-dashboard.yml/badge.svg?branch=container-pa11y-dashboard)](https://github.com/nateprice18f/container-pa11y-test/actions/workflows/cotainer-pa11y-dashboard.yml)

## Pa11y Dashboard 
### The pa11y dashboard repo has been brokendown into three branches
- Main branch only used to create and maintain templates of action workflows, Dockerfile and other supporting artifacts as needed 
- Container-build: This branch is used for pulling a container image from upstream then scanning the image and adds base packages and/or dependencies then creates a base container images for AMD64 and ARM64  
- Container-pa11y-dashboard: This branch uses the container-build image to install and setup pa11y dashboard Note: Web deployment no CLI access.
- Container-pa11y-dashboard-ui: This branch uses the container-build image to install and setup pa11y dashboard Note: Web deployment CLI access.

| Branch | README | Github Actions | Dockerfile | Artifact |
| ------ | ------ | ------ | ------ | ------ |
| [Main](https://github.com/nateprice18f/container-pa11y-test) | [README](https://github.com/nateprice18f/container-pa11y-test/blob/main/README.md) | [Workflow](https://github.com/nateprice18f/container-pa11y-test/blob/main/.github/workflows/template.yml) | [Dockerfile](https://github.com/nateprice18f/container-pa11y-test/blob/main/Dockerfile) |
| [container-pa11y-dashboard](https://github.com/nateprice18f/container-pa11y-test/tree/container-pa11y-dashboard) | [README](https://github.com/nateprice18f/container-pa11y-test/blob/container-pa11y-dashboard/README.md) | [Workflow](https://github.com/nateprice18f/container-pa11y-test/blob/container-pa11y-dashboard/.github/workflows/cotainer-pa11y-dashboard.yml) | [Dockerfile](https://github.com/nateprice18f/container-pa11y-test/blob/container-pa11y-dashboard/Dockerfile) | [Download]() |
| [container-pa11y-mongodb](https://github.com/nateprice18f/container-pa11y-test/tree/container-pa11y-mongodb) | [README](https://github.com/nateprice18f/container-pa11y-test/blob/container-pa11y-mongodb/README.md) | [Workflow](https://github.com/nateprice18f/container-pa11y-test/blob/container-pa11y-mongodb/.github/workflows/container-pa11y-mongodb.yml) | [Dockerfile](https://github.com/nateprice18f/container-pa11y-test/blob/container-pa11y-mongodb/Dockerfile) |
| [Test]() | [README](https://breakdance.github.io/breakdance/) | [Workflow]() | [Dockerfile]() |
