# Jenkins docker image with docker-cli

## Why
The docker binary can no longer be mounted from the host OS to the jenkins docker container.  
The reason is that the binary does not use static linking any more, and therefore fails to find
libraries.  


A symptom for this is warnings in jenkins:
> docker: error while loading shared libraries: libltdl.so.7: cannot open shared object file: No such file or directory

## Versions

This uses the lts of jenkins, whatever that version is, at the time this image is built.  
The docker version is rarely changed, and can be seen in the Dockerfile.

The docker hub automatic build has `jenkins/jenkins` added as a linked repository.  
That means whenever a new version of jenkins is released, this image will also be built.

## Usage

Use like the normal jenkins docker image.  
Mount the docker socket like this: 

```
-v /var/run/docker.sock:/var/run/docker.sock
```

You might get permission issues, even after adding `jenkins` (`uid 1000`) as a user on the host,
and then adding that user to the group `docker` (`gid 497`, might depend on your install).

The dirtiest way to fix this is with `chmod 666 /var/run/docker.sock` on the host.  
However, now everyone has access to docker. Depending on your environment, that might be an issue.
