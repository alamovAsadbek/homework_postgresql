from main_files.decorator.decorator_func import log_decorator


@log_decorator
def main_func():
    text = '''
1. Number of employees
    '''
    print(text)
    try:
        pass
    except Exception as e:
        print(f'Error: {e}')
        main_func()


if __name__ == '__main__':
    main_func()
