from main_files.decorator.decorator_func import log_decorator
from main_files.statistics.statistic import Statistic


@log_decorator
def main_func():
    statistic = Statistic()
    text = '''
1. Number of employees
2. Number of departments
3. Number of employees in departments
    '''
    print(text)
    try:
        user_input = int(input('Enter a number: '))
        if user_input == 1:
            statistic.number_of_employees()
        elif user_input == 2:
            statistic.number_of_departments()
        elif user_input == 3:
            pass
    except Exception as e:
        print(f'Error: {e}')
        main_func()


if __name__ == '__main__':
    main_func()
