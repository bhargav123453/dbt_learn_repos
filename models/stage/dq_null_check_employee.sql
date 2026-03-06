-- 2nd model (dq_null_check_employee.sql)

{{ config(
    materialized='table',
    database='BHARGAV',
    alias='dq_null_check_employee'
) }}

WITH dq_check AS (

    {{ check_nulls(ref('employee'),
        ['EMPLOYEE_ID','SALARY','JOB_TITLE','DEPARTMENT_ID',]) }}

)

SELECT *
FROM dq_check
WHERE null_check_status = 'FAIL'