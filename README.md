# Qt Mapbox in Docker

## Preconditions

- Ubuntu 18.04 LTS

- Install docker and docker compose, and add non-root docker user. 
  - https://docs.docker.com/engine/install/ubuntu/
  - https://docs.docker.com/compose/install/
  - https://docs.docker.com/engine/install/linux-postinstall/

- execute the below command to use x11 in docker.

~~~
$ xhost +
~~~

- running weston

~~~
$ weton --width=800 --height=600 &&
~~~

## How to use

- If you'd like to change your work directory, please edit "setenv.sh"

- build container
~~~
$ . setenv.sh
$ docker-compose build
~~~

- start container
~~~
$ . setenv.sh
$ docker-compose up
~~~

- stop container
~~~
$ docker-compose down
~~~

# referrence

- https://github.com/HidetoKimura/docker_mapbox_build

