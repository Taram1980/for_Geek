# 1. Создать список и заполнить его элементами различных типов данных. Реализовать скрипт проверки типа данных каждого элемента. Использовать функцию type() для проверки типа.
# Элементы списка можно не запрашивать у пользователя, а указать явно, в программе.


# list_ = [3, 3.3, 'country', {'a':1, 'b':2}]
#
# for i in list_:
#     print(type(i))

# 2. Для списка реализовать обмен значений соседних элементов, т.е. Значениями обмениваются элементы с индексами 0 и 1, 2 и 3 и т.д.
# При нечетном количестве элементов последний сохранить на своем месте. Для заполнения списка элементов необходимо использовать функцию input().

# list_ = input('Go: ').split()
# n = 0
# for i in range(int(len(list_)/2)):
#     list_[n], list_[n + 1] = list_[n + 1], list_[n]
#     n += 2
#
# print(list_)

# 3. Пользователь вводит месяц в виде целого числа от 1 до 12. Сообщить к какому времени года относится месяц (зима, весна, лето, осень).
# Напишите решения через list и через dict.

# a = int(input('Enter number from 1 to 12: '))
#
# dict_ = {'winter': [12,1,2], 'spring': [3,4,5], 'summer': [6,7,8], 'autumn': [9,10,11]}
# for k,v in dict_.items():
#     if a in v:
#         print(k)
#
#
# winter = [12, 1, 2]
# spring = [3, 4, 5]
# summer = [6, 7, 8]
# autumn = [9, 10, 11]
# if a in winter:
#     print('winter')
# elif a in spring:
#     print('spring')
# elif a in summer:
#     print('summer')
# elif a in autumn:
#     print('autumn')


# 4. Пользователь вводит строку из нескольких слов, разделённых пробелами. Вывести каждое слово с новой строки. Строки необходимо пронумеровать.
# Если в слово длинное, выводить только первые 10 букв в слове.

# a = str(input('Enter a phrase: '))
#
# numbers = 0
# for i in str.split(a):
#     if len(i) < 5:
#         print(numbers, i)
#     else:
#         print(numbers, i[:10])
#     numbers += 1

# 5. Реализовать структуру «Рейтинг», представляющую собой не возрастающий набор натуральных чисел. У пользователя необходимо запрашивать новый элемент рейтинга.
# Если в рейтинге существуют элементы с одинаковыми значениями, то новый элемент с тем же значением должен разместиться после них.
# Подсказка. Например, набор натуральных чисел: 7, 5, 3, 3, 2.
# Пользователь ввел число 3. Результат: 7, 5, 3, 3, 3, 2.
# Пользователь ввел число 8. Результат: 8, 7, 5, 3, 3, 2.
# Пользователь ввел число 1. Результат: 7, 5, 3, 3, 2, 1.
# Набор натуральных чисел можно задать непосредственно в коде, например, my_list = [7, 5, 3, 3, 2].

# my_list = [7, 5, 3, 3, 2]
# a = int(input('Enter number: '))
# print(sorted(my_list + [a], reverse=True))

# 6. * Реализовать структуру данных «Товары». Она должна представлять собой список кортежей. Каждый кортеж хранит информацию об отдельном товаре.
# В кортеже должно быть два элемента — номер товара и словарь с параметрами (характеристиками товара: название, цена, количество, единица измерения).
# Структуру нужно сформировать программно, т.е. запрашивать все данные у пользователя.
# Пример готовой структуры:
# [
# (1, {“название”: “компьютер”, “цена”: 20000, “количество”: 5, “eд”: “шт.”}),
# (2, {“название”: “принтер”, “цена”: 6000, “количество”: 2, “eд”: “шт.”}),
# (3, {“название”: “сканер”, “цена”: 2000, “количество”: 7, “eд”: “шт.”})
# ]
# Необходимо собрать аналитику о товарах. Реализовать словарь, в котором каждый ключ — характеристика товара, например название, а значение — список значений-характеристик, например список названий товаров.
# Пример:
# {
# “название”: [“компьютер”, “принтер”, “сканер”],
# “цена”: [20000, 6000, 2000],
# “количество”: [5, 2, 7],
# “ед”: [“шт.”]
# }

what = [(1, {'название': 'компьютер', 'цена': 20000, 'количество': 5, 'eд': 'шт.'}),\
(2, {'название': 'принтер', 'цена': 6000, 'количество': 2, 'eд': 'шт.'}),\
(3, {'название': 'сканер', 'цена': 2000, 'количество': 7, 'eд': 'шт.'})]

dict_all = {}
for i in what:
  dic_one = i[1]
  for key in i[1].keys():
    dict_all[key] = []

print(dict_all)
for i in what:
  dic_one = i[1]
  for key in i[1].keys():
    dict_all[key].append(dic_one[key])
print(dict_all)