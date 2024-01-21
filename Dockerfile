FROM python:3.9-slim


WORKDIR /usr/src/app
USER root
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*
COPY ./requirements.txt /app/
RUN pip install -r /app/requirements.txt

COPY ./app.py /app/ 
CMD ["python", "/app/app.py"]