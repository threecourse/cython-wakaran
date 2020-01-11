# python classと型付け
# pythonクラスの変数には型をつけることはできない
# 必要であればそれぞれの関数の一時変数で型をつける
class Cls:
    def __init__(self):
        self.a = 10
        self.b = 10

    def sum(self):
        cdef int x
        x = self.a + self.b
        return x


# 拡張型クラスと型付け
cdef class ClsC:
    cdef public int a
    cdef public int b

    def __init__(self):
        self.a = 10
        self.b = 10

    cpdef int sum(self):
        cdef int x
        x = self.a + self.b
        return x
