FROM rocker/geospatial:4.0.3

LABEL maintainer "Lukas Dargel <lukece@mailbox.org>"

# import settings & snippets
RUN wget https://raw.githubusercontent.com/LukeCe/rdevkit/master/build_resources/user-settings/user-settings-old -P /home/rstudio/.rstudio/monitored/user-settings/ \
    && wget --backups=1 https://raw.githubusercontent.com/LukeCe/rdevkit/master/build_resources/user-settings/user-settings  -P /home/rstudio/.rstudio/monitored/user-settings/ \
    && wget https://raw.githubusercontent.com/LukeCe/rdevkit/master/build_resources/snippets/r.snippets          -P /home/rstudio/.R/snippets/ \
    && wget https://raw.githubusercontent.com/LukeCe/rdevkit/master/build_resources/snippets/markdown.snippets   -P /home/rstudio/.R/snippets/ 

# install data version control
RUN sudo wget https://dvc.org/deb/dvc.list -O /etc/apt/sources.list.d/dvc.list \
    && sudo apt update \
    && sudo apt install dvc

# additional R packages
RUN install2.r --error \
    here \
    golem \
    leaflet.minicharts \
    shinythemes \
    todor \
    colorspace

# Install R packages
RUN install2.r \
    ade4 \
    argparse \
    arules \
    arulesSequences \
    AUC \
    betareg \
    breakpoint \
    cairoDevice \
    caret \
    caretEnsemble \
    cartography \
    changepoint \
    colourpicker \
    corrplot \
    d3heatmap \
    dbscan \
    DescTools \
    doParallel \
    doSNOW \
    dtw \
    dummies \
    dygraphs \
    factoextra \
    FactoInvestigate \
    FactoMineR \
    Factoshiny \
    ff \
    ffbase \
    forecast \
    futile.logger \
    getPass \
    glmnet \
    h2o \
    implyr \
    kernlab \
    kknn \
    kohonen \
    LDAvis \
    leaps \
    lsa \
    mapproj \
    mclust \
    missMDA \
    mlogit \
    mvoutlier \
    networkD3 \
    odbc \
    pagedown \
    plotly \
    pls \
    pROC \
    prophet \
    proxy \
    pvclust \
    randomForest \
    rattle \
    RcmdrMisc \
    recommenderlab \
    RJDBC \
    rjson \
    ROCR \
    ROSE \
    rpart.plot \
    RSelenium \
    rsparkling \
    Rtsne \
    RWeka \
    sas7bdat \
    shinydashboard \
    shinyjs \
    skmeans \
    SnowballC \
    sqldf \
    syuzhet \
    tm \
    topicmodels \
    tree \
    trend \
    TSclust \
    tseries \
    wordcloud \
    xgboost \
    xlsx 

# additional LaTeX packages
RUN   R -e 'tinytex::tlmgr("update --self")'\ 
    && R -e 'tinytex::tlmgr_install(c("amsmath", "atbegshi", "atveryend", "bigintcalc", "bitset", "booktabs", "colortbl", "environ", "epstopdf-pkg", "etexcmds", "etoolbox", "geometry", "gettitlestring", "hycolor", "hyperref", "infwarerr", "intcalc", "kvdefinekeys", "kvoptions", "kvsetkeys", "latex-amsmath-dev", "letltxmacro", "ltxcmds", "mdwtools", "pdfescape", "pdftexcmds", "refcount", "rerunfilecheck", "stringenc", "trimspaces", "uniquecounter", "xcolor", "zapfding"))'

# overwrtie default password
ENV PASSWORD=rdev_007


# install locales 
RUN sudo apt update \
    && sudo apt-get install -y language-pack-de-base language-pack-fr-base language-pack-es-base

