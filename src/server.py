from fastapi import FastAPI
from sql_base import base_worker
from settings import BASE_PATH
from routers.staff import staff_router
from routers.conference import conference_router
from routers.subjects import subjects_router
from routers.users import user_router


base_worker.set_base_path(BASE_PATH)

if not base_worker.check_base():
    base_worker.create_base('../sql/base.sql')

app = FastAPI()


app.include_router(staff_router, prefix='/staff')
app.include_router(subjects_router, prefix='/subjects')
app.include_router(conference_router, prefix='/conference')
app.include_router(user_router, prefix='/users')