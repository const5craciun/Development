FROM python:3.10-slim

RUN apt-get update && apt-get install -y curl build-essential git && rm -rf /var/lib/apt/lists/*

# Install poetry
ENV POETRY_VERSION=1.8.2
RUN pip install "poetry==${POETRY_VERSION}"

WORKDIR /workspace

# Copy dependency files first
COPY pyproject.toml poetry.lock ./

# Disable virtualenv creation and install dependencies globally
RUN poetry config virtualenvs.create false \
    && poetry install --no-root --with dev


# Copy source code and .git folder
COPY .git .git
COPY . .

# Install pre-commit hooks now that .git exists
RUN pre-commit install

CMD ["/bin/bash"]
