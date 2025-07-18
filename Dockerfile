FROM mcr.microsoft.com/devcontainers/python:1-3-bookworm

# Default to using Tsinghua University's PyPI mirror
ARG PIP_INDEX_URL=https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple

# Set up mirror for apt sources
RUN mv /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/debian.sources.bak
COPY .devcontainer/debian.sources /etc/apt/sources.list.d/
RUN apt-get update

# Set up mirror for pip
RUN pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple