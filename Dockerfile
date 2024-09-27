# FROM ubuntu:latest
# RUN apt-get update -y
# RUN apt-get install -y python3-pip python3-dev build-essential python3-venv
# RUN python3 -m venv /app/venv
# COPY . /app
# WORKDIR /app
# RUN /app/venv/bin/pip install -r requirements.txt
# ENTRYPOINT ["/app/venv/bin/python"]
# CMD ["hello.py"]

FROM python:3.9-slim

WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
ENV FLASK_APP=hello.py

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
