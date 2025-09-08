# Base image met Python 3.10
FROM python:3.10-slim

# Werkdirectory in container
WORKDIR /app

# Kopieer alle bestanden naar container
COPY . /app

# Installeer pip dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir rasa-sdk openai

# Zorg dat start.sh uitvoerbaar is
RUN chmod +x /app/start.sh

# Poorten voor Rasa server (5005) en action server (5055)
EXPOSE 5005 5055

# Startscript
ENTRYPOINT ["/app/start.sh"]
CMD ["rasa", "run", "--enable-api", "--model", "20250801-193153-volumetric-arneis.tar", "--cors", "*", "--port", "5005", "--host", "0.0.0.0"]
