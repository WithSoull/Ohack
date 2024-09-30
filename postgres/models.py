from sqlalchemy import Column, String, Integer, TIMESTAMP
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.sql import func

Base = declarative_base()

class Room(Base):
    __tablename__ = "rooms"
    
    id = Column(Integer, primary_key=True, index=True)
    number_room = Column(String, nullable=True)
    hotel_name = Column(String, nullable=False)
    price = Column(Integer, nullable=False)
    updated = Column(TIMESTAMP, server_default=func.now(), onupdate=func.now())
