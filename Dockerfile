FROM jupyter/base-notebook:python-3.7.6

USER root

RUN apt-get update \
    && apt-get install --assume-yes --no-install-recommends \
        make \
        gcc \
        gcc-multilib \
    && rm -rf /var/lib/apt/lists/*

USER jovyan

COPY requirements.build.txt ./
RUN pip install --disable-pip-version-check --no-warn-script-location \
    -r requirements.build.txt

COPY notebooks ./notebooks
WORKDIR /home/jovyan/notebooks

ENV JUPYTER_ENABLE_LAB=yes
