FROM rasa/rasa:latest-full

WORKDIR /app

COPY . /app

USER root
RUN pip install --no-cache-dir openai rasa-sdk
USER 1001

EXPOSE 5005 5055

CMD ["sh", "-c", "rasa run actions --port 5055 & rasa run --enable-api --cors '*' --port 5005 --host 0.0.0.0"]
