# Docker Notes
- Images are nothing else but operating systems
- These images are run on containers and all containers are isolated
- The image is downloaded from hub.ubuntu.com
- We can create a custom image with all tools required for production and publish them on docker hub so that others can access it too
- ``` docker container ls ``` - lists all the running containers
- ``` docker container ls -a``` - lists all the containers( -a is for all)
- ``` docker start <container_name>``` - starts a container with the given name 
- ``` docker stop <container_name>``` - stops a container with the given name 
- ```docker run -it --name name_of_container <image_name>``` - spins up a new image inside named container  
- ``` docker run -it <image_name>``` - spins up a new container inside image
- ``` docker exec <container_name> <command_name>``` - ls command run inside container with given name
- ```docker exec -it <container_name> bash``` - connects terminal with the terminal inside container (-it flag for interactive terminal)
- ```docker images``` - lists all the images

## Port Mapping
``` docker run -it -p <localhost_machine_port>:<container_port> <image_name> ``` - maps/exposes the port inside the docker container to the local machine port
### Multiple ports
``` docker run -it -p <localhost_machine_port_1>:<container_port_1>  -p <localhost_machine_port_2>:<container_port_2> <image_name> ``` 

## Environment variables
``` docker run -it -p <localhost_machine_port>:<container_port> -e key=value  <image_name> ``` - -e flag for environment variables

## Building a custom docker image
- Build a Dockerfile
- Run ```docker build -t <image_name> .```


## Docker Compose
- Set up, create and destroy multiple containers
- Create a file called docker-compose.yml
- This docker-compose contains all of the services required to run
- ```docker compose up``` - to run the entire configuration
- ```docker compose down``` - to remove the configuration
- ``` docker compose up -d``` - run in detached (background mode)

## Docker Networking
- docker can connect to the internet outside the container

### Bridge
- by default Docker runs in `bridge mode`
- ```docker network inspect bridge```- shows all the containers connected to the bridge network and information about the bridge network

### Host
- ```docker run -it --network=host <image_name>``` - runs the image in host mode
- doesnt have a bridge assigned and is directly connected to the host/ our machine

- The main difference between **Bridge mode** and **Host mode is** is that in Bridge mode, **the ports need to be exposed** while in host mode, **the ports are available directly**

### None
- ```docker run -it --network=none <image_name>``` - container has no internet access