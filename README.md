# alpine-base

This repository defines a Docker container based on Alpine that has all updates applied and allows configuration of the administrative user.

The container can be pulled directly from the Docker Hub with the following command:

`docker pull wilfredsmith/alpine-base`

When building the container, you can configure the OS version used and the administrative user. For example,

`docker build --build-arg ADMIN_USERNAME=bubba --build-arg ADMIN_PASSWORD=gump .`

Arguments:																																							 
   ADMIN_GROUP - group name for the OS administrotor (default is administrators)												      		  
   ADMIN_PASSWORD - initial password for the OS administrator (default is insecure). Change this immediately!   					  
	ADMIN_USERNAME - user name of the OS administrator (default is admin)																		     
   ALPINE_VERSION - specify the version of Alpine to use (default is latest).  

NOTA BENE: You should immediately change the password of the administrative user. The value of these arguments can be retrieved by viewing the history of the Docker image.
