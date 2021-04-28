from time import sleep

# 1.

# class TrafficLight:
#     def __init__(self, color):
#         self.color = color
#
#     def running(self):
#         i = 0
#         while i != 3:
#             print(self.color[i])
#             if i == 0:
#                 sleep(7)
#             elif i == 1:
#                 sleep(2)
#             elif i == 2:
#                 sleep(7)
#             i += 1
#
#
# one = TrafficLight(['Red', 'Yellow', 'Green'])
# one.running()

# 2.

# class Road:
#     weight = 10
#     height = 10
#     def __init__(self, l, w):
#         self._length = l
#         self._width = w
#
#     def volume(self):
#         print(self._length * self._width * self.weight * self.height)
#
# one = Road(5, 2)
# one.volume()

#3

# class Worker:
#     def __init__(self, l, w, p, i):
#         self.name = l
#         self.surname = w
#         self.position = p
#         self._income = i
#
#
# class Position(Worker):
#     def get_full_name(self):
#         print(f'{self.name} {self.surname}')
#
#     def get_total_income(self):
#         print(f'Total income: {sum(self._income.values())}')
#
#
# one = Position('John', 'Kennedy', 'Installer', {'Wages': 40, 'Bonus': 1})
# print(one.name, one.surname, one.position, one._income)
# one.get_full_name()
# one.get_total_income()

# 4

# class Car:
#     def __init__(self, s, c, n, p):
#         self.speed = s
#         self.color = c
#         self.name = n
#         self.is_police = p
#
#     def go(self):
#         print('Go')
#
#     def stop(self):
#         print('Stop')
#
#     def turn(self):
#         print('Turn')
#
#     def show_speed(self):
#         print(self.speed)
#
#
# class TownCar(Car):
#     def __init__(self, s, c, n, p, t):
#         super().__init__(s, c, n, p)
#         self.tax = t
#
#     def show_speed(self):
#         if self.speed > 40:
#             print('OverSpeed!')
#         else:
#             print(self.speed)
#
#
# class SportCar(Car):
#     def __init__(self, s, c, n, p, comp):
#         super().__init__(s, c, n, p)
#         self.competition = comp
#
#
# class WorcCar(Car):
#     def __init__(self, s, c, n, p, m):
#         super().__init__(s, c, n, p)
#         self.money = m
#
#     def show_speed(self):
#         if self.speed > 40:
#             print('OverSpeed!')
#         else:
#             print(self.speed)
#
#
# class PoliceCar(Car):
#     def __init__(self, s, c, n, p, o):
#         super().__init__(s, c, n, p)
#         self.order = o
#
# one = Car(40, 'blue', 'Mazda', True)
# one.show_speed()
#
# one = TownCar(50, 'blue', 'Mazda', True, 50)
# one.show_speed()


# 5

# class Stationery:
#     def __init__(self, title):
#         self.title = title
#
#     def draw(self):
#         print(f'Запуск отрисовки.')
#
# class Pen(Stationery):
#     def draw(self):
#         print(f'Запуск 1 инструмента - {self.title}')
# class Pencil(Stationery):
#     def draw(self):
#         print(f'Запуск 2 инструмента - {self.title}')
# class Handle(Stationery):
#     def draw(self):
#         print(f'Запуск 3 инструмента - {self.title}')
#
# pen = Pen("ручка")
# pencil = Pencil("карандаш")
# handle = Handle("маркер")
#
# pen.draw()
# pencil.draw()
# handle.draw()