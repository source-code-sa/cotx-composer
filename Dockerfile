ARG HELIUM_GA_RELEASE=2022.05.24.0
ARG BUILD_ARCH=arm64

FROM quay.io/team-helium/miner:miner-"$BUILD_ARCH"_"$HELIUM_GA_RELEASE"_GA

WORKDIR /opt/miner
ENV HELIUM_GA_RELEASE $HELIUM_GA_RELEASE

COPY build_config/docker.config /opt/miner/releases/"$HELIUM_GA_RELEASE"/sys.config
COPY build_config/ac-sc-sys.config /opt/miner/config/sys.config
#COPY build_config/start-miner.sh /opt/miner/

#RUN echo "$HELIUM_GA_RELEASE" > /etc/lsb_release

ENTRYPOINT ["/opt/miner/bin/miner"]
CMD ["foreground"]