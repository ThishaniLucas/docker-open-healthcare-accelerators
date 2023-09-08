FROM ballerina/jvm-runtime:1.0

RUN apk add --update --no-cache curl jq

RUN mkdir -p /home/ballerina

COPY CernerConnect.jar /home/ballerina/CernerConnect.jar

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    "choreo"

WORKDIR /home/ballerina

EXPOSE  9090
USER 10014

CMD java -jar 'CernerConnect.jar'
