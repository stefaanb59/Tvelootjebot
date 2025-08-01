# Tvelootjebot

## Wat is dit?

Tvelootjebot is een chatbot die eenvoudige fietsherstellingen uitlegt, zoals het afstellen van derailleurs, vervangen van crankas, lekke band herstellen, en meer.

De bot gebruikt Rasa NLU voor intentieherkenning en OpenAI GPT-4 voor generatieve uitleg.

## Setup lokaal

### Vereisten

- Python 3.8+
- Rasa Open Source (https://rasa.com/docs/rasa/installation/)
- OpenAI API key

### Installatie

1. Clone deze repo
2. Installeer dependencies:
   ```
   pip install rasa rasa-sdk openai
   ```
3. Voeg je OpenAI API key toe in `actions/actions.py` bij `openai.api_key`
4. Train het model:
   ```
   rasa train
   ```
5. Start de action server:
   ```
   rasa run actions
   ```
6. Start de Rasa server:
   ```
   rasa run --enable-api --cors "*" --port 5005
   ```
7. Open `webchat/index.html` in je browser en stel je vraag!

## Deployment op Render.com

1. Maak een nieuwe Web Service aan in Render
2. Koppel deze repo via GitHub
3. Stel build command in op `rasa train`
4. Start command: `rasa run --enable-api --cors "*" --port 5005`
5. Voeg environment variables toe voor je OpenAI API key

---

## YouTube video's per herstelling

De bot toont bij elke uitleg een bijpassende YouTube-video.

---

## Veel plezier met Tvelootjebot! 🚲