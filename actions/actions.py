from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
import json
import openai
import os
openai.api_key = os.getenv("OPENAI_API_KEY")

class ActionHandleFietsherstelling(Action):
    def name(self):
        return "action_handle_fietsherstelling"

    def run(self, dispatcher, tracker, domain):
        intent = tracker.latest_message['intent'].get('name')
        with open("youtube_links.json") as f:
            links = json.load(f)

        prompt = f"Je bent een ervaren fietstechnieker. Leg stap voor stap uit hoe je deze herstelling uitvoert: {intent.replace('_', ' ')}. Gebruik heldere taal, maximaal 8 stappen."

        completion = openai.ChatCompletion.create(
            model="gpt-4",
            messages=[{"role": "user", "content": prompt}]
        )

        uitleg = completion['choices'][0]['message']['content']
        youtube_url = links.get(intent, "Geen video gevonden.")

        dispatcher.utter_message(text=uitleg)
        dispatcher.utter_message(text=f"👉 Bekijk ook deze video: {youtube_url}")

        return []
