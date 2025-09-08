FROM python:3.10-slim

WORKDIR /app
COPY . /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install rasa-sdk openai

RUN chmod +x /app/start.sh

EXPOSE 5005 5055

ENTRYPOINT ["/app/start.sh"]
CMD ["rasa", "run", "--enable-api", "--model", "20250801-193153-volumetric-arneis.tar", "--cors", "*", "--port", "5005", "--host", "0.0.0.0"]
