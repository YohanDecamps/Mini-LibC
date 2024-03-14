# Mini LibC

Second Year Epitech Project

## Assignement

Recode 12 of the C standard library functions in Assembly x86-64.

## Installation

After clonning the repository you can test the functions by writing this C code:

```c

int main(void) {
    void *buff = dlopen("./libasm.so", RTLD_LAZY);
    char *s;
    void *(*funptr)(void *, int, size_t) = dlsym(buff, "func name");
    s = funptr(s, 'o', 10);

    printf("%s\n", s);
}

```

and replace "func name" with the name of the function you want to test.

you can then compile the code with the following command:

```bash
make
gcc *.c
./a.out
```

![alt text](ASM.png)
