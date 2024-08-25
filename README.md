# General
This is a basic veilid headless server, running on RHEL UBI9. 

Veilid is a project underway to help us take back the internet.  Its a secure, peer to peer, and decentralized network within the existing internet.  You can read more on the [Veilid project's web site](https://www.veilid.com). 

This container is meant to make it easy for anyone with some basic container knowledge to stand up a veilid headless node. A headless node does nothing more than bolster the connectivity of veilid. 

# How to Run

Currently, all configuration is managed with a `veilid.conf` file that is stored at `/config/veilid.conf` within the container. You can copy the included [veilid.conf](https://github.com/gangrif/veilid-server-ubi/blob/main/veilid.conf) file from the supporting github repo, and add it to your veilid-config volume if you would like to make changes to the configuration of the server.  

Veilid-server also logs to /config/veilid.log, so mapping /config in is a good idea if you would like the log file to be accessible.

The veilid server also stores persistent data in `/var/db/veilid-server` so that needs to be mapped in as well.

I recommend creating two volumes, one for config, the other for data.  Then map them in as follows
* /your/config/directory:/config (Place veilid.conf in here if desired)
* /your/data/directory:/var/db/veilid-server

## Build and run on Podman

First build the container with:

```podman build -t veilid-server .```


And then run it using:

```
podman run -p 5150:5150 \
  -v /your/config/directory:/config:Z \
  -v /your/data/directory:/var/db/veilid-server:Z \
  veilid-server
```

## Build and run on Docker

First build the container with:

```docker build -t veilid-server .```


And then run it using:

```
docker run -p 5150:5150 \
  -v /your/config/directory:/config:Z \
  -v /your/data/directory:/var/db/veilid-server:Z \
  veilid-server
```


## Connecting to the CLI
```[podman|docker] exec -it <container-name> veilid-cli```

