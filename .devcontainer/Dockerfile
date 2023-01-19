FROM mcr.microsoft.com/devcontainers/python:3.8-bullseye

ENV PYTHONUNBUFFERED 1

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        bash-completion \
        postgresql-client \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip --disable-pip-version-check --no-cache-dir install poetry \
 && poetry completions bash > /etc/bash_completion.d/poetry
