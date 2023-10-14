from fastapi import APIRouter
from sql_base.models import conference
import resolvers.conference


conference_router = APIRouter()

@conference_router.get("/get")
def get_conference():
    return f'Response:{{text:Страница с информацией о конференции}}'

@conference_router.post("/create")
def new_cconference(conference: conference,):
    new_id = resolvers.conference.new_conference(conference)
    return f"{{code: 201, id: {new_id}}}"

@conference_router.delete("/delete/{conference_id}")
def delete_conference(conference_id: int):
    return f'delete conference {conference_id}'


