FROM alpine:3.7

RUN apk -v add --update \
        bash \
        git \
        jq \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic demjson && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
