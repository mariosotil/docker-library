# docker-library

## docker-builder

**IMPORTANT: this container exposes the Docker daemon socket to its users. To learn more about that, read [The Dangers of Docker.sock](https://raesene.github.io/blog/2016/03/06/The-Dangers-Of-Docker.sock/). This is provided "AS IS". There's no guarantee.**

You can build the container cloning this repo, and running:

    $ docker build -t your-account/docker-builder .

You can run it with this command:

    $ docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -it your-account/docker-builder

A bash prompt will be opened. You can build an image (in this case, a GoLang compiler, using a Dockerfile from an official Docker repo) using this command:

    bash4.3#  /root/build.sh local/golang https://github.com/docker-library/golang.git 1.7

The build.sh script receives three parameters:
- The name of the local image (local/golang)
- The URL to the git repo (https://github.com/docker-library/golang.git)
- The folder where the script can find the Dockerfile (1.7)

If the image was not built before, it will pull the folder with the Dockerfile from the git repo, build the image, and save it into the local storage. Otherwise, it will just finish.

**ToDo:**
- Protect `build.sh` against parameter injection 
- `build.sh` should check if the Dockerfile or the resources changed. In that case, it will build the container again
- Read from private git repos
- Run `docker-builder` using a non-root user
- Consider to use Docker in Docker

Looking forward for your comments, improvements, ideas, etc.
