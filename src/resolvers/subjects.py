from sql_base import base_worker
from sql_base import models

def get_subject(subject_id: int):
    return base_worker.insert_data("SELECT name  FROM subject WHERE id =?",
                               (subject_id,))

def new_subject(subject: models.Subjects, ) -> int:
    new_id = base_worker.insert_data("INSERT INTO Subjects(name) "
                                     "VALUES(?) "
                                     "RETURNING id",
                                     (subject.name, ))
    return new_id

def delete_subject(subject_id: int):
    return base_worker.execute(query="DELETE FROM Subjects WHERE id=? ",
                              args=(subject_id,))
