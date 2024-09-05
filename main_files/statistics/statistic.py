from components.pagination.pagination import Pagination
from main_files.database.db_setting import execute_query
from main_files.decorator.decorator_func import log_decorator
from main_files.manage.manage import run_query


class Statistic:
    def __init__(self):
        run_query()

    @log_decorator
    def number_of_employees(self):
        query = '''
        SELECT c.name as NAME, COUNT(c.ID) as All_EMPLOYEES
        FROM company c
        LEFT JOIN department d ON d.COMPANY_ID = c.ID
        LEFT JOIN employee e ON e.DEPARTMENT_ID = d.id
        GROUP BY c.name;
        '''
        result = execute_query(query, fetch='all')
        pagination = Pagination(table_name='users', table_keys=[0, 1], display_keys=['Name', 'Count'],
                                data=result)
        pagination.page_tab()
        return result
