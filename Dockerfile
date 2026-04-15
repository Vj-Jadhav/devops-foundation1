FROM python:3.9
WORKDIR /app
COPY . .
CMD ["echo", "CI Pipeline Running"]