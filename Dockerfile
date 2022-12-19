FROM openjdk:8-jdk-alpine
ARG GH_REPO_OWNER
ARG NAME_ZIP
RUN \
  echo "**** install build packages ****" && \
  apk add --no-cache \
    dos2unix \
    curl \
    wget \
    unzip \
    bash && \
  curl -s https://api.github.com/repos/${GH_REPO_OWNER}/AscensionChat/releases/latest \
    | grep "browser_download_url.*zip" \
    | cut -d '"' -f 4 \
    | wget -qi - && \
  unzip ${NAME_ZIP}-*.zip && \
  rm ${NAME_ZIP}-*.zip && \
  mv wowchat/* ./ && \
  rm -R wowchat/ && \
  dos2unix run.sh && \
  apk del \
    dos2unix \
    curl \
    wget \
    unzip

ENTRYPOINT ["bash","run.sh"]