# General
This is a basic veilid headless server, running on RHEL UBI9. 

Veilid is a project underway to help us take back the internet.  Its a secure, peer to peer, and decentralized network within the existing internet.  You can read more on the [Veilid project's web site](https://www.veilid.com). 

This container is meant to make it easy for anyone with some basic container knowledge to stand up a veilid headless node. 

# How to Run

Currently, all configuration is managed with a `veilid.conf` file that is stored at `/data/veilid.conf` within the container. You can copy the included `veilid.conf` file from this repo, and map it in as a volume if you would like to make changes to the configuration of the server.  

## Build and run on Podman

First build the container with:

`podman build -t veilid-server .`


And then run it using:

`podman run -p 5150:5150 -v /path/to/my/veilid.conf:/data/veilid.conf:Z veilid-server`

## Build and run on Docker

First build the container with:

`docker build -t veilid-server .`


And then run it using:

`docker run -p 5150:5150 -v /path/to/my/veilid.conf:/data/veilid.conf:Z veilid-server`

