FROM registry.access.redhat.com/ubi9/ubi
RUN dnf update -y
RUN dnf config-manager --add-repo https://packages.veilid.net/rpm/stable/x86_64/veilid-stable-x86_64-rpm.repo
RUN dnf install -y veilid-server veilid-cli
RUN usermod -d /var/db/veilid-server veilid
EXPOSE 5150
RUN mkdir /data
COPY veilid.conf /data/veilid.conf
RUN chown -R veilid:veilid /data
USER veilid
CMD veilid-server -c /data/veilid.conf
