from main_files.decorator.decorator_func import log_decorator
from main_files.statistics.statistic import Statistic


@log_decorator
def main_func():
    statistic = Statistic()
    text = '''
1. Number of employees
    '''
    print(text)
    try:
        user_input = int(input('Enter a number: '))
        if user_input == 1:
            statistic.number_of_employees()
    except Exception as e:
        print(f'Error: {e}')
        main_func()


if __name__ == '__main__':
    main_func()
