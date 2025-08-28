from typing import Annotated

from fastapi import Depends, FastAPI, HTTPException, Query
from sqlmodel import Field, Session, SQLModel, create_engine, select


class User(SQLModel, table=True):
    ID: int = Field(default=None, primary_key=True)
    Name: str
    Email: str = Field(unique=True)