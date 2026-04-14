FROM python:3.9-slim

RUN useradd -m myuser

WORKDIR /app

# ✅ Copy only requirements first
COPY requirements.txt .

# ✅ Install Flask
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of files
COPY . .

RUN chown -R myuser:myuser /app

USER myuser

CMD ["python", "app.py"]



