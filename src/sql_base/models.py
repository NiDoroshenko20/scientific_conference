from datetime import datetime
from typing import Optional
from pydantic import BaseModel



class User(BaseModel):
    login: str
    password: str
    post: Optional[int]
    reg_date: Optional[datetime]

class Mark(BaseModel):
    id: Optional[int]
    staff_id: int
    subject_id: int
    conference_id: int
    mark: int

class Subjects(BaseModel):
    id: Optional[int]
    name: str

class staff(BaseModel):
    id: Optional[int]
    name: str
    surname: str
    code_departments: int
    positions: str
    scientific_degree: str


class conference(BaseModel):
    id: Optional[int]
    name_conference: str
    code_department: int
    code_director: str
    nachalo_provedenie: str
    konec_provedenie: str
    code_type_provedenie: Optional[str]
    classroom: str
    code_plan: str
    code_report: str
    code_order: str
    code_sections: Optional[str]

#class universities(BaseModel):
#    id: Optional[int]
#    name_university: Optional[str]
#    telephone: Optional[int]
#    address: Optional[str]
#    email: Optional[str]
#    code_faculty: Optional[str]
#    code_city: Optional[str]
#    number_of_universities: Optional[str]

#class faculty(BaseModel):
#    id: Optional[int]
#    name_faculty: Optional[str]
#    telephone: Optional[int]
#    email: Optional[str]
#    code_departments: Optional[str]

#class departments(BaseModel):
#    id: Optional[int]
#    name_departments: Optional[str]
#    telephone: Optional[int]
#    email: Optional[str]
#    code_specialty: Optional[str]

#class students(BaseModel):
#    id: Optional[int]
#    FIO: str
#    code_department: Optional[int]
#    code_group: Optional[str]
#    date_of_birth: Optional[str]

#class academic_degrees(BaseModel):
#    id: Optional[int]
#    scientific_degree: Optional[str]

#class approving(BaseModel):
#    id: Optional[int]
#    code_employee: Optional[str]

#class type_conference(BaseModel):
#    id: Optional[int]
#    type_conference: Optional[str]

#class plans(BaseModel):
#    id: Optional[int]
#    code_provedenie: Optional[str]
#    calendar_year: Optional[str]

#class sections(BaseModel):
#    id: Optional[int]
#    name_sections: Optional[str]
#    code_doclada: Optional[str]

#class doclad(BaseModel):
#    id: Optional[int]
#    topic_doclad: Optional[str]
#    code_students: Optional[str]

