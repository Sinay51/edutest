# Utilisez une image Python officielle comme image de base
FROM python:3.11

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
#RUN pip install python-dotenv

COPY . .

RUN pip install -e .

WORKDIR /usr/src/app/src/edutest
CMD [ "flask", "--app", "app.py", "run", "--port", "5000", "--host", "0.0.0.0"]
