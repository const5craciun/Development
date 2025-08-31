FROM python:3.10-slim

WORKDIR /workbench

RUN apt-get update && apt-get install -y \
    git curl build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/root/.local/bin:$PATH"

COPY pyproject.toml poetry.lock* /workbench/

RUN poetry install --no-root --with dev

COPY . /workbench

EXPOSE 5555

CMD ["poetry", "run", "jupyter", "lab", "--ip=0.0.0.0", "--port=5555", "--allow-root", "--no-browser", "--ServerApp.token=''", "--ServerApp.password=''"]
