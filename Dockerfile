FROM alpine

ENV REPOSITORY=https://github.com/glowdigitalmedia/docker-puller.git

RUN apk update && \
    apk add openssh git curl python docker

RUN git clone $REPOSITORY

RUN rm /docker-puller/dockerpuller/scripts/*

VOLUME /docker-puller/dockerpuller/scripts/

EXPOSE 8000

WORKDIR /docker-puller/dockerpuller/
ENTRYPOINT ["sh", "-c"]
CMD ["exec python app.py"]