import pyximport
import numpy as np

pyximport.install(setup_args={'include_dirs': [np.get_include()]})

from cython_func import quad, quad_c, ary_sum, ary_sum_c, ary_add, ary_add_c
from cython_class import Cls, ClsC
from cpp_class.CppCls import CppCls

if __name__ == "__main__":
    # python関数 + 型の指定
    print(quad(5))

    # c関数
    print(quad_c(5))

    # python関数 + 型の指定 - numpy.ndarray
    ary = np.arange(12).reshape(3, 4).astype(float)
    print(ary_sum(ary))
    ary2 = ary.copy()
    ary_add(ary2, 10)
    print(ary2)

    # c関数 - numpy.ndarray
    print(ary_sum_c(ary))
    ary2 = ary.copy()
    ary_add_c(ary2, 10)
    print(ary2)

    # pythonクラス + 型の指定
    cls = Cls()
    cls.a = 15
    print(cls.sum())

    # cクラス + 型の指定
    cls = ClsC()
    cls.a = 15
    print(cls.sum())

    # c++のクラスを読み込む
    cls = CppCls()
    print(cls.x, cls.y, cls.sum())
