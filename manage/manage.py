from main_files.database.db_setting import execute_query
from main_files.decorator.decorator_func import log_decorator


class Manage:
    @log_decorator
    def create_company_table(self):
        query = '''
        CREATE TABLE IF NOT EXISTS company (
        ID BIGSERIAL PRIMARY KEY,
        NAME VARCHAR(255) NOT NULL,
        CREATED_AT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        )
        '''
        execute_query(query)
        return True

    @log_decorator
    def insert_company_table(self):
        pass
