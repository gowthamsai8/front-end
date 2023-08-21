FROM node:4-alpine


WORKDIR /opt/frontend

COPY . .

RUN npm install

EXPOSE 8079

CMD npm start

FROM node:4-alpine
ARG user=app
ARG group=app
ARG uid=5001
ARG gid=5001

RUN addgroup -g ${gid} -S ${group} && \
  adduser -u ${uid} -S ${user} -G ${user}


WORKDIR /opt/frontend

COPY . .

RUN npm install

EXPOSE 8079

RUN chown -R ${user} .

USER ${user}

CMD npm start
