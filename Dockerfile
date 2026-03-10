FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl build-essential

# poetry
RUN pip install "poetry==1.8.2"

RUN poetry config virtualenvs.create false

WORKDIR /app

# copy dependency files first (better docker caching)
COPY pyproject.toml poetry.lock ./

RUN poetry install --no-root

COPY app/ ./app

CMD ["python", "app/main.py"]
