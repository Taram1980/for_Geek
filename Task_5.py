# import json

# 1. Создать программно файл в текстовом формате, записать в него построчно данные, вводимые пользователем. Об окончании ввода данных свидетельствует пустая строка.

# f = open('../file.txt', 'w', encoding='utf-8')
# while True:
#     a = input('Your text: ')
#     if a == '':
#         break
#     f.write(a+'\n')
# f.close()

# 2. Создать текстовый файл (не программно), сохранить в нем несколько строк, выполнить подсчет количества строк, количества слов в каждой строке.

# with open('../file.txt', 'r', encoding='utf-8') as file_obj:
#     list_ = file_obj.readlines()
#     b = 0
#     for i in list_:
#         b = b + 1
#         # print(len(i))
#         c = len(i)
#         print(f'строкa: {b}, cлов: {c}')


# 3. Создать текстовый файл (не программно), построчно записать фамилии сотрудников и величину их окладов. Определить, кто из сотрудников имеет оклад менее 20 тыс.,
# вывести фамилии этих сотрудников. Выполнить подсчет средней величины дохода сотрудников.

# with open('../text_3.txt', 'r', encoding='utf-8') as text3:
#     list_ = text3.read().split('\n')
#
# salary = []
# for i in list_:
#     if (float(i.split(' ')[1])) > 20000:
#         print(i.split(' ')[0])
#     salary.append(float(i.split(' ')[1]))
# print(f'Avarage wages are: {sum(salary) / len(salary)}')

# 4. Создать (не программно) текстовый файл со следующим содержимым:
# One — 1
# Two — 2
# Three — 3
# Four — 4
# Необходимо написать программу, открывающую файл на чтение и считывающую построчно данные. При этом английские числительные должны заменяться на русские.
# Новый блок строк должен записываться в новый текстовый файл.

# with open('../text_4.txt', 'r', encoding='utf-8') as text4:
#     list_ = text4.read().split('\n')
# print((list_))
#
# change_new = {}
# for i in list_:
#     change_new.update({(str(i.split(' - ')[0])): (int(i.split(' - ')[1]))})
# print('answer', change_new)
#
# change_old = {'One': 'Один', 'Two': 'Два', 'Three': 'Три', 'Four': 'Четыре'}
#
# for k, v in zip(change_old.keys(), change_old.values()):
#     if k in change_new:
#         change_new[v] = change_new.pop(k)
# print(change_new)
#
# with open('../new_text_4.txt', 'w', encoding='utf-8') as new_text4:
#     new_text4.writelines(change_new)
#
# with open('../new_text_4.txt', 'r', encoding='utf-8') as new_text4:
#     print('finish', new_text4.readlines())
#
#
# rus = {'One': 'Один', 'Two': 'Два', 'Three': 'Три', 'Four': 'Четыре'}
# new_file = []
# with open('../text_4.txt', 'r') as file_obj:
#     for i in file_obj:
#         i = i.split(' ', 1)
#         new_file.append(rus[i[0]] + '  ' + i[1])
#     print(new_file)
#
# with open('../file_4_new.txt', 'w') as file_obj_2:
#     file_obj_2.writelines(new_file)


# 5. Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных пробелами. Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.


# with open('../text_5.txt', 'w', encoding='utf-8') as file:
#     numbers = input('Enter numbers: ')
#     file.writelines(numbers)
#
# with open('../text_5.txt', 'r', encoding='utf-8') as file:
#     list_ = file.read().split()
# list_ = [float(item) for item in list_]
# print(sum(list_))


# 6. Необходимо создать (не программно) текстовый файл, где каждая строка описывает учебный предмет и наличие лекционных, практических и
# лабораторных занятий по этому предмету и их количество. Важно, чтобы для каждого предмета не обязательно были все типы занятий.
# Сформировать словарь, содержащий название предмета и общее количество занятий по нему. Вывести словарь на экран.

# with open('../text_6.txt', 'r', encoding='utf-8') as text:
#     list_ = text.readlines()

# sub_ = []
# for i in list_:
#     sub = i.split(':')[0]
#     sub_.append(sub)
# print(sub_)
#
# list_1 = []
# for i in list_:
#     item = i.split(':')[1:]
#     #     print(item)
#     item = item[0].replace("-", "0()").replace('(', '').replace(')', '')
#     #     print(item)
#     item = item.split(' ')
#     #     print(item)
#     for ii in item:
#         iii = "".join(c for c in ii if c.isdecimal())
#         try:
#             iii = int(iii)
#         except:
#             continue
#
#         list_1.append(iii)
#
# print(list_1)
#
# dic = {}
# for i, ii in zip(range(len(sub_)), range(0, 19, 3)):
#     dic[sub_[i]] = (sum(list_1[ii : ii + 3]))
#
#
# print(dic)


# 7. Создать (не программно) текстовый файл, в котором каждая строка должна содержать данные о фирме: название, форма собственности, выручка, издержки.
# Пример строки файла: firm_1 ООО 10000 5000.
# Необходимо построчно прочитать файл, вычислить прибыль каждой компании, а также среднюю прибыль. Если фирма получила убытки, в расчет средней прибыли ее не включать.
# Далее реализовать список. Он должен содержать словарь с фирмами и их прибылями, а также словарь со средней прибылью.
# Если фирма получила убытки, также добавить ее в словарь (со значением убытков).
# Пример списка: [{“firm_1”: 5000, “firm_2”: 3000, “firm_3”: 1000}, {“average_profit”: 2000}].
# Итоговый список сохранить в виде json-объекта в соответствующий файл.
# Пример json-объекта:
# [{"firm_1": 5000, "firm_2": 3000, "firm_3": 1000}, {"average_profit": 2000}]
#
# Подсказка: использовать менеджеры контекста.
#
#
# with open('../text_7.txt', 'r', encoding='utf-8') as text:
#     list_ = text.read().split()
#
# profit = []
# for i in range(2, len(list_)-2, 4):
#     print(i)
#     profit.append(float(list_[i]) - float(list_[i + 1]))
# print(profit, round(sum(profit)/len(profit), 2))
# only_profit = round(sum([pr for pr in profit if pr > 0]) / len([pr for pr in profit if pr > 0]), 2)
#
# print(only_profit, profit)
#
# dic = {}
# for i in range(0, len(list_) - 3, 4):
#     dic[f'{list_[i]}_{list_[i + 1]}'] = float(list_[i + 2]) - float(list_[i + 3])
#
# final_list = [dic, {"average_profit": only_profit}]
# print(final_list)
#
# with open('../final_list.json', 'w', encoding = 'utf-8') as json_:
#     json.dump(final_list, json_, ensure_ascii = False)
#
# with open('../final_list.json', 'r', encoding = 'utf-8') as json_:
#     final_list_from_json = json.load(json_)
# print(final_list_from_json, type(final_list_from_json))


