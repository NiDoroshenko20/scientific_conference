from fastapi import APIRouter
from sql_base import Subjects
import resolvers.subjects

subjects_router = APIRouter()

@subjects_router.get("/")
def get_subject():
    return f'Response:{{text:Страница доступна}}'

@subjects_router.post("/create")
def new_subject(subject: Subjects, ):
    new_id = resolvers.subjects.new_subject(subject)
    return f'{{code: 201, id: {new_id}}}'

@subjects_router.delete("/delete/{subj_id}")
def delete_subject(subject_id: int):
    return f'delete staff {subject_id}'
