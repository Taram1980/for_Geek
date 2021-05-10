1.

# class Data:
#     def __init__(self, date):
#         self.date = date
#
#     @classmethod
#     def split(cls, date):
#         date = Data(date)
#         return [int(a) for a in (str.split(date.date, '-'))]
#
#     @staticmethod
#     def valid(date):
#         date = Data.split(date)
#         if date[1] in list(range(1, 13)):
#             return True
#         else:
#             return False
#
#
# one = Data('26-22-1980')
# print(f'init: {one.date} valid: {one.valid(one.date)} split: {one.split(one.date)}')

# 2.

# a, b = input('Enter 2 number: ').split()
#
# class MyOwnError(Exception):
#     def __init__(self, text):
#         self.text = text
# try:
#     a = int(a)
#     b = int(b)
#     if b == 0:
#         raise MyOwnError('the denominator is 0')
# except (ValueError, MyOwnError) as Error:
#     print(Error)
# else:
#     print(a / b)

# 3
# class my_owne_error(Exception):
#     def __init__(self, text):
#         self.text = text
# #
# def your_func():
#     s = []
#     while True:
#         list_ = input('Enter numbers: ').split()
#         for num in list_:
#             if num == 'q':
#                 # print('hear')
#                 print(s)
#                 return
#             else:
#                 try:
#                     if str.replace(num, '.', '').isdecimal() != True:
#                         raise my_owne_error('str!')
#                     num = float(num)
#                 except (my_owne_error) as E:
#                     print(E)
#                     continue
#                 else:
#                     s.append(num)
# your_func()

# 7

# class complex_:
#     def __init__(self, real, fictional):
#         self.real = real
#         self.fictional = fictional
#
#     def __add__(self, other):  # as object
#         return complex_((round(self.real + other.real, 2)), round(self.fictional + other.fictional, 2))
#
#     def __mul__(self, other):  # numbers
#         return f'real: {round(self.real * other.real - self.fictional * other.fictional, 2)} \
# fictional: {round(self.real * other.fictional - self.fictional * other.real, 2)}'
#
#
# one = complex_(10.1, 5.5)
# two = complex_(1.4, -10.5)
# print(f'{(one + two).real} {(one + two).fictional}i')
# print(one * two)


#4,5,6

# def count(self, name):
#     pr = 0
#     of1 = 0
#     of2 = 0
#     sum_ = len(self._dict[name])
#     for i in range(len(self._dict[name])):
#         if self._dict[name][i]['office'] == 0:
#             pr += 1
#         elif self._dict[name][i]['office'] == 1:
#             of1 += 1
#         elif self._dict[name][i]['office'] == 2:
#             of2 += 1
#     return pr, of1, of2, sum_
#
#
# class fix_nambers:
#     def __init__(self, printer_count):
#         self.__printer_count = printer_count
#
#     @property
#     def fix_namber(self):
#         return (self.__printer_count)
#
#     @fix_namber.setter
#     def fix_namber(self, value):
#         if isinstance(value, str):
#             raise storage_error('Str is not a number')
#         self.__printer_count = value
#
#
# class storage_error(Exception):
#
#     def __init__(self, text):
#         self.text = text
#
#
# class storage:
#     def __init__(self):
#         self._dict = {}
#
#     def add_to(self, equipment, count):
#         print(f'add {count} of {equipment.model} in the storage')
#         if equipment.group == 'printer':
#             fix_namber_obj = fix_nambers(count)
#             fix_namber_obj.fix_namber = count
#             count = fix_namber_obj.fix_namber
#             for i in range(count):
#                 self._dict.setdefault(equipment.model, []).append(equipment.__dict__)
#         #                 self._dict.append(equipment.__dict__)
#         else:
#             for i in range(count):
#                 self._dict.setdefault(equipment.model, []).append(equipment.__dict__)
#
#     #                 self._dict.append(equipment.__dict__)
#
#     def extract_from(self, model, count, office):
#         #         dic_temp = []
#         #         dic_temp = self._dict
#         print(f'extract {count} of {model} from the storage to the office {office}')
#         pr = 0
#         for i in range(len(self._dict[model])):
#             if self._dict[model][i]['office'] == 0:
#                 pr += 1
#         if pr >= count:
#             for i in range(count):
#                 #                 dic_temp[model][i]['office'] = office
#                 #                 self._dict[model][i]['office'] = office
#                 self._dict.setdefault(model).pop(0)
#         #             self._dict = dic_temp
#         else:
#             raise storage_error('There are no required products in the storage. Change the number.')
#
#     def info_count(self, model):
#         print(f'number of {model} in the storage:  {count(self, model)[0]}\n' \
#               f'number of {model} in the office_1: {count(self, model)[1]}\n' \
#               f'number of {model} in the office_2: {count(self, model)[2]}'
#               )
#
#
# class office_equipment:
#     def __init__(self, name, price, model, office=0):
#         self.name = name
#         self.price = price
#         self.model = model
#         self.office = office
#         #         self.order  = order
#         self.group = self.__class__.__name__
#
#
# class printer(office_equipment):
#     def __init__(self, name, price, model, series):
#         super().__init__(name, price, model)
#         self.series = series
#
#     def __str__(self):
#         return (f'Price: {self.price}')
#
#     @property
#     def series(self):
#         return self.series
#
#     @series.setter
#     def series(self, year):
#         if year > 2000:
#             self.year = 'new'
#         if year <= 2000:
#             self.year = 'old'
#
#
# class laptop(office_equipment):
#     def __init__(self, name, price, model):
#         super().__init__(name, price, model)
#
#
# class board(office_equipment):
#     def __init__(self, name, price, model):
#         super().__init__(name, price, model)
#
#
# # MENU
#
# s1 = storage()
#
# b1  = board('board', 100, 'b100')
# b2  = board('board', 150, 'b200')
# l1  = laptop('lp', 1500, 'l100')
# p400  = printer('printer', 500, 'hp400', 1990)
#
# s1.add_to(b1, 2)
# s1.add_to(b2, 2)
# s1.add_to(l1, 1)
# s1.add_to(p400, 3)
# s1.info_count('b100')
# s1.info_count('l100')
# s1.info_count('b200')
# s1.info_count('l100')
# s1.info_count('hp400')
# s1.extract_from('hp400', 1, 1)
# s1.info_count('hp400')
# s1.info_count('hp400')
# s1.extract_from('hp400', 2, 1)
# s1.info_count('hp400')
#
#
# s1.info_count('hp400')
# s1.extract_from('hp400', 2, 1)
# s1.info_count('hp400')
#
# # use class fix_nambers and class storage_error(Exception)
# s1.add_to(p400, 'sdfdfd')