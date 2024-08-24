# Quadlet definition examples
These files are not meant to be used without modification, your deployment will likely differ from mine.  These examples should get you close. 

On a podman host, these files are designed to work with Quadlet. Quadlet makes it easy to turn podman definitions into systemd units. 

modify these files for things such as the IP address that you would like to bind the container to (or remove the IP addressif you would simply like host port 5150 mapped), and the directory paths for your data and config volumes.  Then drop them into `/etc/containers/systemd`, and run a `systemctl daemon-reload`.  

You should then have systemd units for `veilid-server-data-volume`, `veilid-server-config-volume`, and `veilid-pod`.  Starting these services should give you volumes mapped to your desired locations, and a podman pod running the veilid-server inside of a container. 