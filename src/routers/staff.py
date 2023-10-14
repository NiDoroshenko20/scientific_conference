from fastapi import APIRouter
from sql_base.models import staff
import resolvers.staff

staff_router = APIRouter()

@staff_router.get("/")
def get_staff():
    return f'Response:{{text:Страница со списком сотрудников}}'

@staff_router.post("/create")
def new_staff(staff: staff,):
    new_id = resolvers.staff.new_staff(staff)
    return f"{{code: 201, id: {new_id}}}"

@staff_router.delete("/delete/{staff_id}")
def delete_staff(staff_id: int):
    return f'delete staff {staff_id}'


