# Pythonの関数
def quad(int x):
    cdef int y = x * 2
    return y << 1

# cの関数
cpdef int quad_c(int x):
    cdef int y = x * 2
    return y << 1

import numpy as np
cimport numpy as np

ctypedef np.npy_intp SIZE_t  # Type for indices and counters
ctypedef np.npy_float64 DOUBLE_t  # Type of y, sample_weight

# pythonの関数によるnumpyの扱い
def ary_sum(np.ndarray[DOUBLE_t, ndim=2] ary):
    cdef int x, y
    cdef double v = 0
    for y in range(ary.shape[0]):
        for x in range(ary.shape[1]):
            v += ary[y, x]
    return v

# cの関数によるnumpyの扱い
cpdef double ary_sum_c(np.ndarray[DOUBLE_t, ndim=2] ary):
    cdef int x, y
    cdef double v = 0
    for y in range(ary.shape[0]):
        for x in range(ary.shape[1]):
            v += ary[y, x]
    return v

# pythonの関数によるnumpyの扱い - numpy配列の値の変更
def ary_add(np.ndarray[DOUBLE_t, ndim=2] ary, double a):
    cdef int x, y
    cdef double v = 0
    for y in range(ary.shape[0]):
        for x in range(ary.shape[1]):
            ary[y, x] += a

# cの関数によるnumpyの扱い - numpy配列の値の変更
cpdef void ary_add_c(np.ndarray[DOUBLE_t, ndim=2] ary, double a):
    cdef int x, y
    cdef double v = 0
    for y in range(ary.shape[0]):
        for x in range(ary.shape[1]):
            ary[y, x] += a
