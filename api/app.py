from fastapi import FastAPI, HTTPException
from mangum import Mangum
import os

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hellos {name}"}


handler = Mangum(app)
