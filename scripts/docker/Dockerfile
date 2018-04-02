##
# ASPRSorg/LAS

FROM ubuntu:xenial

MAINTAINER Howard Butler <howard@hobu.co>

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 16126D3A3E5C1192    \
    && apt-get update \
    && apt-get install -y --fix-missing --no-install-recommends \
            software-properties-common build-essential ca-certificates \
            git make cmake wget unzip libtool automake python-pip \
            libpython-dev libjpeg-dev zlib1g-dev \
            python-dev python-pip g++ doxygen dvipng \
            cmake libjpeg8-dev zlib1g-dev texlive-latex-base \
            texlive-latex-extra git texlive-fonts-recommended texlive-latex-recommended \
            graphviz python-matplotlib \
            python-setuptools imagemagick latexmk \
    && apt-get remove --purge -y $BUILD_PACKAGES  && rm -rf /var/lib/apt/lists/*



RUN pip install breathe \
    sphinx_bootstrap_theme awscli sphinxcontrib-bibtex \
    sphinx_rtd_theme gitpython

RUN git clone https://github.com/sphinx-doc/sphinx.git && cd sphinx \
    && git checkout stable \
    && python setup.py install

