# distutils: language = c++
# distutils: sources = cppclass.cpp

cdef extern from "cppclass.h":
    cdef cppclass CppClass:
        int x, y
        CppClass()
        int sum()

cdef class CppCls:

    cdef CppClass *_thisptr

    def __cinit__(self):
        self._thisptr = new CppClass()
        if self._thisptr == NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._thisptr != NULL:
            del self._thisptr

    @property
    def x(self):
        return self._thisptr.x

    @property
    def y(self):
        return self._thisptr.y

    cpdef int sum(self):
        return self._thisptr.sum()

