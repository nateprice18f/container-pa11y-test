# Docker Compose Container Setup

1. Replace image: ```Container image``` with the correct container image
2. Replace ```/path/to/local/storage or ENV Example: ${PWD}``` with the correct local workspace folder
3. Replace ```/path/to/container/storage``` with the correct container path
4. Save the dockercompose.yml
5. Open a command prompt or terminal and navigate to the directory containing the ```docker-compose.yml``` file.
6. Run the following command to start the container: ```docker-compose up```

This will create a Docker container that mounts the container image to the local storage readonly.
