FROM registry.access.redhat.com/ubi9/ubi
RUN dnf config-manager --add-repo https://packages.veilid.net/rpm/stable/x86_64/veilid-stable-x86_64-rpm.repo
RUN dnf install -y veilid-server veilid-cli
EXPOSE 5150
RUN mkdir /data
COPY veilid.conf /data/veilid.conf
RUN chown -R veilid:veilid /data
CMD su veilid -c 'veilid-server -c /data/veilid.conf'
