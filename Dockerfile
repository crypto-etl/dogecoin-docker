FROM ubuntu
LABEL maintainer="Allen Day allenday@allenday.com"
RUN apt-get update && apt-get install -y software-properties-common build-essential wget pkg-config 
RUN apt-get install -y libboost-all-dev libssl-dev libevent-dev
RUN apt-get install -y bsdmainutils automake autoconf
WORKDIR /opt
RUN wget https://github.com/dogecoin/dogecoin/archive/v1.10.0.tar.gz
RUN tar -xvzf v1.10.0.tar.gz
WORKDIR /opt/dogecoin-1.10.0
RUN ./autogen.sh
RUN ./configure --disable-wallet
RUN make -j4
