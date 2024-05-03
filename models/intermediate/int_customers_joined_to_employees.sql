with customers_joined_to_employees as (
    select
        customers.customer_id,
        customers.customer_first_name,
        customers.customer_last_name,
        customers.customer_work_company,
        customers.customer_mailing_address,
        customers.customer_mailing_city,
        customers.customer_mailing_state,
        customers.customer_mailing_country,
        customers.customer_phone_number,
        customer_fax_number,
        customer_email_address,
        employee_id,
        employee_first_name,
        employee_last_name,
        employee_title,
        employee_birth_date,
        employee_hired_date,
        employee_address,
        employee_city,
        employee_state,
        employee_country,
        employee_zipcode,
        employee_phone_number,
        employee_email_address,
        supervisor_employee_id,
        concat(employee_first_name, ' ', employee_last_name) as employee_name
    from {{ ref('stg_music_customers') }} as customers
    inner join {{ ref('stg_music_employees') }} as employees
        on customers.customer_id = employees.employee_id
)

select * from customers_joined_to_employees
