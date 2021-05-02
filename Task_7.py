from abc import ABC, abstractmethod

# class Matrix:
#     def __init__(self, matrix_):
#         self.matrix_ = matrix_
#
#     def __str__(self):
#         return '\n'.join([' '.join([str(el) for el in i]) for i in self.matrix_])
#
#     def __add__(self, other):
#         return ([[self.matrix_[i][ii] + other.matrix_[i][ii] for i in range(len(self.matrix_))] for ii in
#                  range(len(self.matrix_[0]))])
#
# one = Matrix([[1,2,3],[4,5,6],[7,8,9], [10,11,12]])
# two = Matrix([[10,20,30],[40,50,60],[70,80,90], [100,110,120]])
# print(one)
# print(10*'**')
# print(two)
# print(10*'**')
# print(one + two)

# 2


# class Clothes(ABC):
#     def __init__(self, size, height):
#         self.size = size
#         self.height = height
#
#     def my_method_1(self):
#         print(f'total needs {round(self.size / 6.5 + 0.5 + self.height * 2 + 0.3, 2)} of fabric')
#
#
# class Coat(Clothes):
#     def __init__(self, size):
#         self.size = size
#
#     @property
#     def size(self):
#         return self.__size
#
#     @size.setter
#     def size(self, values):
#         if type(values) is int:
#             self.__size = values
#         else:
#             print('only int')
#             self.__size = round(values, 0)
#
#
#
#     @property
#     def my_method_1(self):
#         print(f'for the coat needs {round(self.size / 6.5 + 0.5, 2)} of fabric')
#
#
# class Suit(Clothes):
#
#     def __init__(self):
#         self.height = None
#
#     @property
#     def height_(self):
#         return self._height
#
#     @height_.setter
#     def height_(self, values):
#         if values > 1.2 and values < 2.2:
#             self.height = values
#         else:
#             print('check your parameter')
#
#     #     @property
#     def my_method_1(self):
#         print(f'for the suit needs {round(self.height * 2 + 0.3, 2)} fabric')
#
# suit = Suit()
# suit.height_ = 1.8
# suit.my_method_1()
#
# coat = Coat(30)
# coat.my_method_1
#
# cloathes = Clothes(30, 1.8)
# cloathes.my_method_1()


# 3

# class Kletka:
#
#     def __init__(self, number):
#         self.number = number
#
#     def __add__(self, other):
#         return f'sum: {round(self.number + other.number, 0)}'
#
#     def __sub__(self, other):
#         if (self.number - other.number) >= 0:
#             return f'sub: {round(self.number - other.number, 0)}'
#         else:
#             return 'Collapse'
#
#     def __mul__(self, other):
#         return f'mul: {round(self.number * other.number, 0)}'
#
#     def __truediv__(self, other):
#         return f'div: {round(self.number / other.number, 0)}'
#
#     def make_order(self, row):
#         result = ''
#         for i in range(int(self.number / row)):
#             result += row * '*' + '\n'
#         result += (self.number % row) * '*' + '\n'
#         return result
#
# ten  = Kletka(10)
# five = Kletka(5)
# print(ten + five)
# print(ten * five)
# print(ten / five)
# print(ten - five)
# print(ten.make_order(3))


