FROM postgres:13.4
RUN localedef -i fr_BE -c -f UTF-8 -A /usr/share/locale/locale.alias fr_BE.UTF-8
ENV LANG=fr_BE.utf8
RUN apt-get update && apt-get install -y locales barman-cli
COPY initdb.d/* /docker-entrypoint-initdb.d
