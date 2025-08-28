from typing import Union,Annotated

#Sql connection
from sqlmodel import Session
from DB.Engine.dbEngine import create_db_and_tables,get_session
#Sql model
from DB.Model.userModel import User

#FastAPI
from fastapi import FastAPI,Depends


SessionDep = Annotated[Session, Depends(get_session)]
app = FastAPI()

@app.on_event("startup") # Load DB and tables when app get started, use lifespan instead of on_event becouse on fast api this call is deprecated
def on_startup():
    create_db_and_tables()

@app.get("/")
async def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
async def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}

@app.post("/user/")
def create_hero(hero: User, session: SessionDep) -> User:
    session.add(hero) # Add User object into the session, this action doesn't save item into db just set it to proccess it after
    session.commit() # Insert object into database
    session.refresh(hero) # Read again data in db and update user object inb the memory, that's useful becouse if the item has a field created automatically like the ID the db refresh that data
    return hero