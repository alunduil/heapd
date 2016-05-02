FROM haskell:7
MAINTAINER Alex Brandt <alunduil@alunduil.com>

EXPOSE 8080
WORKDIR /usr/local/src/heapd

RUN cabal update

COPY ./heapd.cabal /usr/local/src/heapd/heapd.cabal
RUN cabal install --only-dependencies

COPY . /usr/local/src/heapd
RUN cabal install 

ENTRYPOINT [ "heapd" ]
