# docker-library

## docker-builder

**IMPORTANT: this container exposes the Docker daemon socket to its users. To learn more about that, read [The Dangers of Docker.sock](https://raesene.github.io/blog/2016/03/06/The-Dangers-Of-Docker.sock/).**

**This container is provided "AS IS". There's no any guarantee.**

You can run the container with this command:

    $ docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -it mariosotil/docker-builder

A bash prompt will be opened. You can build an image (in this case, a GoLang compiler, using a Dockerfile from an official Docker repo) using this command:

    bash4.3#  /root/build.sh local/golang https://github.com/docker-library/golang.git 1.7

The build.sh script receives three parameters:
- The name of the local image (local/golang)
- The URL to the git repo (https://github.com/docker-library/golang.git)
- The folder where the script can find the Dockerfile (1.7)

If the image was not built before, it will pull the folder with the Dockerfile from the git repo, build the image, and save it into the local storage. Otherwise, it will just continue.

The built container is [here](https://hub.docker.com/r/mariosotil/docker-builder).

**ToDo:**
- Protect build.sh against parameter injection 
- Read from private git repos
- Run docker-builder using a non-root user
- Check if the Dockerfile or the resources changed, so the script will build the container again

Looking forward for your comments, improvements, ideas, etc.
