####################################################################################################################################
#																																											  #
# Dockerfile - Docker container definition for wilfredsmith/alpine-base															    [Dockerfile] #
#																																											  #
# Copyright (c) 2014-2019, Wilfred A. Smith. All rights reserved.																					     #
#																																											  #
# Arguments:																																							  #
#	  ADMIN_GROUP - group name for the OS administrotor (default is administrators)												      		  #
#	  ADMIN_PASSWORD - initial password for the OS administrator (default is insecure). Change this immediately!   					  #
#	  ADMIN_USERNAME - user name of the OS administrator (default is admin)																		     #
#    ALPINE_VERSION - specify the version of Alpine to use (default is latest).   																  #
#																																											  #
####################################################################################################################################

ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION}
ARG ALPINE_VERSION
LABEL maintainer="Wilfred Smith"
ARG ADMIN_USERNAME=admin
ARG ADMIN_GROUP=administrators
ARG ADMIN_PASSWORD=insecure

RUN echo "Building alpine-base with Alpine $ALPINE_VERSION" && \
    echo "User: $ADMIN_GROUP:$ADMIN_USERNAME will have initial password $ADMIN_PASSWORD"

RUN apk update && \
    apk upgrade && \
    apk add sudo

RUN addgroup $ADMIN_GROUP
RUN adduser -D -u 1001 -s /bin/sh $ADMIN_USERNAME $ADMIN_GROUP
RUN echo "$ADMIN_USERNAME:$ADMIN_PASSWORD" | /usr/sbin/chpasswd
RUN echo "$ADMIN_USERNAME   ALL=(ALL) ALL" >> /etc/sudoers

USER $ADMIN_USERNAME
WORKDIR /home/$ADMIN_USERNAME

