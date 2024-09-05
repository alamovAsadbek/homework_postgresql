from main_files.database.db_setting import execute_query
from main_files.decorator.decorator_func import log_decorator
from main_files.manage.manage import run_query


class Statistic:
    def __init__(self):
        run_query()

    @log_decorator
    def number_of_employees(self):
        query = '''
        SELECT c.name, COUNT(*)
        FROM COMPANY AS c
        LEFT JOIN DEPARTMENT AS d ON c.department_id = d.id
        LEFT JOIN EMPLOYEE AS e ON e.DEPARTMENT_ID = d.id
        GROUP BY c.name, COUNT(*)
        '''
        result = execute_query(query)
        return result
