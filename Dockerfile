FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04

RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list && \
apt update && \
apt install -y bash \
                   build-essential \
                   git \
                   curl \
                   ca-certificates \
                   python3 \
                   python3-pip && \
    rm -rf /var/lib/apt/lists

RUN python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir \
    torch \
    torchvision \
    scikit-learn \
    simpletransformers

RUN mkdir /electra
WORKDIR /electra

CMD ["python3", "classification.py"]