FROM postgres:15.2

ENV POSTGRES_PASSWORD=secretkey
ENV POSTGRES_DB=wikidataru
ENV POSTGRES_USER=blacksnow
ADD ./scripts/init.sql /docker-entrypoint-initdb.d
ADD ./scripts/links/big-dump.sql /docker-entrypoint-initdb.d
ADD ./scripts/pages/big-dump.sql /docker-entrypoint-initdb.d
EXPOSE 5432