FROM rasa/rasa:3.7.1-full

# Create app directory
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies for custom actions
USER root
RUN pip install --no-cache-dir openai rasa-sdk

USER 1001

# Expose ports for Rasa and actions
EXPOSE 5005 5055

# Start action server and rasa server in parallel
CMD rasa run actions & rasa run --enable-api --cors "*" --port 5005