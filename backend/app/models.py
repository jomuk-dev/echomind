from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column

from datetime import datetime


class Base(DeclarativeBase):
    pass


class Photo(Base):
    __tablename__ = "photos"

    id: Mapped[int] = mapped_column(primary_key=True)

    asset_id: Mapped[str]
    created_at: Mapped[datetime]

    ocr_text: Mapped[str | None]
    ai_caption: Mapped[str | None]