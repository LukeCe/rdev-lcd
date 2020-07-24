FROM rocker/geospatial:3.6.3

LABEL maintainer "Lukas Dargel <lukece@mailbox.org>"

COPY /build_resources/user-settings  /home/rstudio/.rstudio/monitored/user-settings/

RUN install2.r --error \
    here \
    golem \
    leaflet.minicharts \
    shinythemes


