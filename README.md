# Jenkins docker image with docker-cli

The docker binary can no longer be mounted from the host OS to the jenkins docker container.  
The reason is that the binary does not use static linking any more, and therefore fails to find
libraries.  


A symptom for this is warnings in jenkins:
> docker: error while loading shared libraries: libltdl.so.7: cannot open shared object file: No such file or directory


This uses the lts of jenkins, whatever that version is, at the time this image is built.  
The docker version is rarely changed, and can be seen in the Dockerfile.
