FROM jupyter/base-notebook:python-3.7.6

USER root

RUN apt-get update \
    && apt-get install --assume-yes --no-install-recommends \
        make \
        gcc \
        gcc-multilib \
    && rm -rf /var/lib/apt/lists/*

USER jovyan
