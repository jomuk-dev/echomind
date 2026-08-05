from datetime import datetime

from pydantic import BaseModel


class PhotoCreate(BaseModel):
    asset_id: str
    created_at: datetime