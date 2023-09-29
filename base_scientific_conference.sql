CREATE TABLE post(
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(100)  NOT NULL);

CREATE TABLE users(
    id INTEGER NOT NULL PRIMARY KEY,
    login VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    post INTEGER NOT NULL,
    FOREIGN KEY (post) REFERENCES post(id));

CREATE TABLE IF NOT EXISTS staff(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    name VARCHAR(15) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    code_departments VARCHAR(100) NOT NULL,
    positions VARCHAR(100) NOT NULL,
    scientific_degree VARCHAR(100) NOT NULL,
    FOREIGN KEY (code_departments)
        REFERENCES departments(id)
        ON DELETE SET NULL ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS conference(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    name_conference VARCHAR(100) NOT NULL,
    code_department VARCHAR(100) NOT NULL,
    code_director VARCHAR(100) NOT NULL,
    nachalo_provedenie VARCHAR(100) NOT NULL,
    konec_provedenie VARCHAR(100) NOT NULL,
    code_type_provedenie INTEGER NOT NULL,
    classroom INTEGER NOT NULL,
    code_plan INTEGER NOT NULL,
    code_report INTEGER NOT NULL,
    code_order INTEGER NOT NULL,
    code_sections INTEGER NOT NULL,
    FOREIGN KEY (code_type_provedenie)
        REFERENCES type_conference(id)
        ON DELETE SET NULL ON UPDATE NO ACTION,
    FOREIGN KEY (code_director)
        REFERENCES staff(id)
        ON DELETE SET NULL ON UPDATE NO ACTION,
    FOREIGN KEY (code_plan)
        REFERENCES plans(id)
        ON DELETE SET NULL ON UPDATE NO ACTION,
    FOREIGN KEY (code_sections)
        REFERENCES sections(id)
        ON DELETE SET NULL ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS universities(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    name_university VARCHAR(100) NOT NULL,
    telephone INTEGER NOT NULL,
    address VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    code_faculty INTEGER NOT NULL,
    code_city INTEGER NOT NULL,
    number_of_universities INTEGER NOT NULL,
    FOREIGN KEY (code_faculty)
        REFERENCES faculty(id)
        ON DELETE SET NULL ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS faculty(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    name_faculty VARCHAR(100) NOT NULL,
    telephone INTEGER NOT NULL,
    email VARCHAR(100) NOT NULL,
    code_departments INTEGER NOT NULL,
    FOREIGN KEY (code_departments)
        REFERENCES departments(id)
        ON DELETE SET NULL ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS departments(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    name_departments VARCHAR(100) NOT NULL,
    telephone INTEGER NOT NULL,
    email VARCHAR(100) NOT NULL,
    code_specialty INTEGER NOT NULL);

CREATE TABLE IF NOT EXISTS students(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    FIO VARCHAR(100) NOT NULL,
    code_department INTEGER NOT NULL,
    code_group VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL);

CREATE TABLE IF NOT EXISTS academic_degrees(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    scientific_degree VARCHAR(100) NOT NULL);

CREATE TABLE IF NOT EXISTS approving(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    code_employee INTEGER NOT NULL,
    FOREIGN KEY (code_employee)
        REFERENCES staff(id)
        ON DELETE SET NULL ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS type_conference(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    type_conference VARCHAR(100) NOT NULL);

CREATE TABLE IF NOT EXISTS plans(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    code_provedenie INTEGER NOT NULL,
    calendar_year DATE NOT NULL);

CREATE TABLE IF NOT EXISTS sections(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    name_sections VARCHAR(100) NOT NULL,
    code_doclada INTEGER NOT NULL,
    FOREIGN KEY (code_doclada)
        REFERENCES doclad(id)
        ON DELETE SET NULL ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS doclad(
    id INTEGER NOT NULL PRIMARY KEY UNIQUE,
    topic_doclad VARCHAR(100) NOT NULL,
    code_students INTEGER NOT NULL,
    FOREIGN KEY (code_students)
        REFERENCES students(id)
        ON DELETE SET NULL ON UPDATE NO ACTION);

CREATE TABLE subjects(
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(150)
);


INSERT INTO post(id, name)
VALUES (1, 'Admin'), (2, 'Director');

INSERT INTO users(id, login, password, post)
VALUES (1, 'admin', 'admin', 1);

INSERT INTO staff(name, surname)
VALUES ('name','surname','departments','positions','scientific_degree'),('name1','surname1','departments1','positions1','scientific_degree1');

INSERT INTO conference(name_conference, code_department, code_director, nachalo_provedenie, konec_provedenie, code_type_provedenie, classroom, code_plan, code_report, code_order, code_sections)
VALUES ('name_conference1','code_department1','code_director1','nachalo_provedenie1','konec_provedenie1','code_type_provedenie1','classroom1','code_plan1','code_order1','code_sections1');

INSERT INTO universities(name_university, telephone, address, email, code_faculty, code_city,number_of_universities)
VALUES ('name_university', 'telephone', 'address', 'email', 'code_faculty', 'code_city','number_of_universities'),('name_university1', 'telephone1', 'address1', 'email1', 'code_faculty1', 'code_city1','number_of_universities1');

INSERT INTO faculty(name_faculty, telephone, email, code_departments)
VALUES ('name_faculty', 'telephone', 'email', 'code_departments'),('name_faculty1', 'telephone1', 'email1', 'code_departments1');

INSERT INTO students(FIO, code_departament,code_group,date_of_birth)
VALUES ('FIO', 'code_departament','code_group','date_of_birth'),('FIO1', 'code_departament1','code_group1','date_of_birth1');

INSERT INTO academic_degrees(scientific_degree)
VALUES ('scientific_degree'),('scientific_degree1');

INSERT INTO approving(code_employee)
VALUES ('code_employee'),('code_employee');

INSERT INTO type_conference(type_conference)
VALUES ('type_conference'),('type_conference1');

INSERT INTO plans(code_provedenie, calendar_year)
VALUES ('code_provedenie','calendar_year'),('code_provedenie1','calendar_year1');

INSERT INTO sections (name_sections, code_doclada)
VALUES ('name_sections', 'code_doclada'),('name_sections1', 'code_doclada1');

INSERT INTO doclad (topic_doclad, code_students)
VALUES ('topic_doclad, code_students'),('topic_doclad1, code_students1');