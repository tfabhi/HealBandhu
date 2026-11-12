from fastapi import FastAPI

app = FastAPI(
    title="HealBandhu API",
    description="Starter API for the HealBandhu prototype.",
    version="0.1.0",
)


@app.get("/")
def root():
    return {
        "project": "HealBandhu",
        "status": "starter",
        "message": "API is running. No clinical decision support is implemented.",
    }


@app.get("/health")
def health():
    return {"status": "ok"}
