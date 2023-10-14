from sql_base import base_worker
from sql_base import models

def get_conference(conference_id: int):
    return base_worker.insert_data("SELECT id, name_conference, code_department, code_director, nachalo_provedenie,konec_provedenie, code_type_provedenie, classroom, code_plan, code_report, code_order, code_sections  FROM conference WHERE id =?",
                               (conference_id,))
def new_conference(conference: models.conference) -> int:
    new_id = base_worker.insert_data("INSERT INTO conference (id, name_conference, code_department, code_director, nachalo_provedenie,"
                                     "konec_provedenie, code_type_provedenie, classroom, code_plan, code_report, code_order, code_sections)"
                                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                                 "RETURNING id",
                                 (conference.id, conference.name_conference, conference.code_department, conference.code_director, conference.nachalo_provedenie,
                                  conference.konec_provedenie,conference.code_type_provedenie,conference.classroom,conference.code_plan,conference.code_report,conference.code_order,conference.code_sections))
    return new_id
def delete_conference(conference_id: int):
    return base_worker.execute(query="DELETE FROM conference WHERE id=? ",
                              args=(conference_id,))

