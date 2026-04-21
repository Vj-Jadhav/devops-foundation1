# Stage 1: Builder
FROM python:3.10-slim AS builder

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

# Stage 2: Final Production Image
FROM python:3.10-slim

WORKDIR /app

COPY --from=builder /app /app

RUN useradd -m appuser

USER appuser

EXPOSE 5000

CMD ["python", "app.py"]