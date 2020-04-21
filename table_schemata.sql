CREATE TABLE "Department" (
    "dept_no" VARCHAR NOT NULL,
    "dept_name" VARCHAR (50) NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_Manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

-- Table documentation comment 1 (try the PDF/RTF export)
CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "brithday" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "gender" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salary" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
	"from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Title" (
    "emp_no" int   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Title" ADD CONSTRAINT "fk_Title_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");