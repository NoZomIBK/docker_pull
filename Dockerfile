FROM alpine

ENV REPOSITORY=https://github.com/glowdigitalmedia/docker-puller.git

RUN apk update && \
    apk add openssh git curl python

RUN git clone $REPOSITORY

RUN rm docker-puller/dockerpuller/scripts/*

VOLUME docker-puller/dockerpuller/scripts/

EXPOSE 8000

ENTRYPOINT ["sh", "-c"]
CMD ["exec python app.py"]