from fastapi import FastAPI

app = FastAPI(title="F1 Telemetry Core API")

@app.get("/health")
def health():
    return {"status": "ok"}
