# docker (feb 2019)

## prerequisites
check your system on how to install and run docker. docker service must be
running (`systemctl start docker`). it may be useful to add your user to group
`docker` (`usermod -aG docker $USER`), otherwise use `sudo`.
to test your installation run the following, it should work.

```sh
docker --version
docker info
docker run hello-world
```

## interactive one-shot containers
checkout lots of distributions, `alpine` is a minimal distribution designed for
embedded systems and containers. there are also images preinstalled with
languages. more images can be found on [dockerhub](https://hub.docker.com/).
for most images there are optional tags to fine-tune some characteristics of the
image. tags are appended after `:`, see python example below.

```sh
# system shell
docker run -it --rm alpine ash
docker run -it --rm archlinux/base bash
docker run -it --rm debian bash
docker run -it --rm fedora bash
docker run -it --rm ubuntu bash
# programming languages
docker run -it --rm haskell ghci
docker run -it --rm node node
docker run -it --rm python python
docker run -it --rm python:alpine python
```

## dockerfile & services
attached are some example dockerfiles and a makefile to test them.
this makefile is only meant as a lazy way to save some shell commands, it's not
intended as a proper way to orchestrate containers, use `docker-compose` or
something similar for that.

`make 01` and `make 02` create images with included scripts, execute them and
exit. `make 03` and `make 04` include a simple service, start it in background
and test it via `curl localhost:5000`. don't forget to stop the containers with
`make 03-stop` and `make 04-stop`.

## docker admin
docker downloads lots of stuff, sometimes you will check what it's done or
cleanup.

```sh
docker info
docker image ls -a
docker container ls -a
docker ps
docker system prune --all
```
