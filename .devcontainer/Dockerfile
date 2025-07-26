FROM python:3.10-slim

RUN apt-get update && apt-get install -y curl build-essential git && rm -rf /var/lib/apt/lists/*

# Install poetry
ENV POETRY_VERSION=1.8.2
RUN pip install "poetry==${POETRY_VERSION}"

# Set working directory
WORKDIR /workspace

# Copy pyproject.toml and poetry.lock from project root (context root)
COPY pyproject.toml poetry.lock ./

# Install dependencies
RUN poetry config virtualenvs.create true \
    && poetry install --no-root --with dev

# Copy the rest of your source code
COPY . .

CMD [ "/bin/bash" ]
