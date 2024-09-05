from main_files.decorator.decorator_func import log_decorator
from main_files.statistics.statistic import Statistic


@log_decorator
def main_func():
    statistic = Statistic()
    text = '''
1. Number of employees
2. Number of departments
3. Number of employees in departments
4. Departments Without staff
5. Employees information
    '''
    print(text)
    try:
        user_input = int(input('Enter a number: '))
        if user_input == 1:
            statistic.number_of_employees()
        elif user_input == 2:
            statistic.number_of_departments()
        elif user_input == 3:
            statistic.number_of_employees_in_departments()
        elif user_input == 4:
            statistic.departments_without_staff()
        elif user_input == 5:
            statistic.employee_information()
        else:
            print('Invalid input')
        main_func()
    except Exception as e:
        print(f'Error: {e}')
        main_func()


if __name__ == '__main__':
    main_func()
