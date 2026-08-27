FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential libpq-dev curl \
    && rm -rf /var/lib/apt/lists/*

COPY requirements*.txt /app/
RUN pip install --upgrade pip \
    && pip install -r /app/requirements.txt \
    && if [ -f /app/requirements-dev.txt ]; then pip install -r /app/requirements-dev.txt; fi

COPY DjangoServer /app

EXPOSE 8000

CMD ["uvicorn", "DjangoServer.asgi:application", "--host", "0.0.0.0", "--port", "8000", "--reload"]
