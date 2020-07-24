FROM rocker/geospatial:3.6.3

LABEL maintainer "Lukas Dargel <lukece@mailbox.org>"

# import settings & snippets
RUN curl -o /home/rstudio/.rstudio/monitored/user-settings/user-settings https://raw.githubusercontent.com/LukeCe/rdevkit/master/build_resources/user-settings/user-settings \
    && curl -o /home/rstudio/.rstudio/monitored/user-settings/user-settings-old https://raw.githubusercontent.com/LukeCe/rdevkit/master/build_resources/user-settings/user-settings-old \ 
    && curl -o  /home/rstudio/.R/snippets/r.snippets https://raw.githubusercontent.com/LukeCe/rdevkit/master/build_resources/snippets/r.snippets \
    && curl -o  /home/rstudio/.R/snippets/markdown.snippets https://raw.githubusercontent.com/LukeCe/rdevkit/master/build_resources/snippets/markdown.snippets


# install data version control
RUN sudo wget https://dvc.org/deb/dvc.list -O /etc/apt/sources.list.d/dvc.list \
    && sudo apt update \
    && sudo apt install dvc

# additional packages	
RUN install2.r --error \
    here \
    golem \
    leaflet.minicharts \
    shinythemes


