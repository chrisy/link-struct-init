A simple build environment to exercise a linker issue.

We have two C modules, `a.c` and `b.c` and a header file `a.h` included by both.

`a.h` defines a structure with a indeterminate length array at the end. It also then provides a declaration of that structure called `test`.

`a.c` repeats the declaration.

`b.c` also has the declaration but in addition provides an intializer for it.

On impacted platforms, if the linker encounters `a.o` before `b.o` then it will complain that the symbol changed size. If it sees them the other way round then it does not.

The `Makefile` includes a target for binary `a` and binary `b` which swap in which order the linker is provided the compiled object files.

On impacted platforms you can expect this output:

```
$ make
gcc -Wall -Werror   -c -o a.o a.c
gcc -Wall -Werror   -c -o b.o b.c
gcc -o a a.o b.o
/usr/bin/ld: Warning: size of symbol `test' changed from 8 in a.o to 24 in b.o
gcc -o b b.o a.o
```

It is not yet clear why some platforms see this and others do not.
