FROM postgres:13.2
RUN localedef -i fr_BE -c -f UTF-8 -A /usr/share/locale/locale.alias fr_BE.UTF-8
ENV LANG=en_US.utf8
RUN apt-get update && apt-get install -y locales barman-cli
COPY initdb.d/* /docker-entrypoint-initdb.d
COPY .ssh/* /var/lib/postgresql/.ssh/
RUN chown -R postgres:postgres /var/lib/postgresql/.ssh

