import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from main import app

def test_health_endpoint():
    response = app.test_client().get("/health")
    assert response.status_code == 200
    assert response.get_json()["status"] == "healthy"

def test_ready_endpoint():
    response = app.test_client().get("/ready")
    assert response.status_code == 200
    assert response.get_json()["status"] == "ready"
