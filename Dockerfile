FROM alpine

# Get packages needed to download and build.
RUN apk update && apk add --no-cache --virtual .build-deps alpine-sdk

COPY pfe-0.33.71.tar.bz2 /pfe.tar.bz2
RUN bunzip2 pfe.tar.bz2 && tar xvf pfe.tar

WORKDIR /pfe-0.33.71

# Remove unsupported --warn-common option from pfe/configure
RUN sed -i '/warn-common/d' pfe/configure

RUN ./configure && make && make install

WORKDIR /

# Remove the build directory and sources.
RUN rm -rf pfe-0.33.71
RUN rm -f pfe.tar

# Remove the packages we needed.
RUN apk del .build-deps \
  && rm -rf /var/cache/apk/*

CMD pfe

