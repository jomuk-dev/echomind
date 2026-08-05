from fastapi import Depends, FastAPI
from sqlalchemy.orm import Session

from app.database import get_db
from app.models import Photo
from app.schemas import PhotoCreate

app = FastAPI(
    title="EchoMind API",
    version="0.1.0"
)


@app.get("/")
def root():
    return {
        "project": "EchoMind",
        "status": "running"
    }


@app.get("/health")
def health():
    return {
        "status": "ok"
    }


@app.post("/photos")
def create_photo(
    photo: PhotoCreate,
    db: Session = Depends(get_db),
):
    existing = (
        db.query(Photo)
        .filter(Photo.asset_id == photo.asset_id)
        .first()
    )

    if existing:
        return {
            "message": "Photo already indexed",
            "asset_id": existing.asset_id,
        }

    new_photo = Photo(
        asset_id=photo.asset_id,
        created_at=photo.created_at,
    )

    db.add(new_photo)
    db.commit()
    db.refresh(new_photo)

    return {
        "message": "Photo indexed",
        "id": new_photo.id,
        "asset_id": new_photo.asset_id,
    }