# HealBandhu — Starter Repository

HealBandhu is a proposed multilingual healthcare information assistant for rural and semi-urban communities. This repository is a **fresh starter scaffold reconstructed from the project description and presentation**, not a recovery of the original source code.

## Included in this starter
- Flutter mobile app with a simple dashboard
- Demo chat screen (rule-based sample replies; **not an AI medical chatbot**)
- Medicine label text extraction from a selected image using Google ML Kit
- Minimal FastAPI backend with a health-check endpoint
- Git ignore rules and setup instructions

## Planned integrations (not implemented here)
Dialogflow/Rasa, Firebase authentication and sync, vaccination reminders, ABHA, CoWIN/IDSP or other government APIs, verified health-centre search, push notifications, and production-grade multilingual support.

## Requirements
- Flutter SDK and Android Studio / Android SDK
- Python 3.10+
- Git

## Run the Flutter app
1. Open a terminal in the `mobile` folder.
2. Run:
   ```bash
   flutter pub get
   flutter run
   ```

## Run the backend
1. Open another terminal in `backend`.
2. Create and activate a virtual environment.
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Start the API:
   ```bash
   uvicorn app.main:app --reload
   ```
5. Visit `http://127.0.0.1:8000/health`.

## Before publishing publicly
- Review every file and remove private information.
- Never commit API keys, passwords, `.env` files, Firebase service-account JSON, signing keys, or real patient data.
- Do not describe demo chat replies as diagnosis or medical advice.
- Add only features that you have implemented and tested to your resume/project description.

## Suggested next steps
1. Replace demo chatbot logic with a properly evaluated conversational system.
2. Add language selection and reviewed translations.
3. Add secure authentication and encrypted storage.
4. Integrate official health data sources only after verifying their current API access and terms.
5. Add tests, accessibility checks, and a clear medical-safety workflow.
