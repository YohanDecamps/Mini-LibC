##
## EPITECH PROJECT, 2023
## Assembly
## File description:
## Makefile
##

SRC	=	src/strlen.asm		\
		src/strchr.asm		\
		src/strrchr.asm		\
		src/memset.asm		\
		src/memcpy.asm		\
		src/strcmp.asm		\
		src/memmove.asm		\
		src/strncmp.asm		\
		src/strcasecmp.asm	\
		src/strstr.asm		\
		src/strpbrk.asm		\
		src/strcspn.asm

OBJ	=	$(SRC:.asm=.o)

SRC_TESTS	=	tests/tests.c

NAME_TESTS	=	unit_tests

OBJ_TESTS	=	$(SRC_TESTS:.c=.o)

%.o: %.asm
	nasm -f elf64 $<

LDFLAGS	=	-L.

LDLIBS	=	-lasm -lcriterion -lgcov

NAME	=	libasm.so

all:	$(NAME)
.PHONY:	all

$(NAME):	$(OBJ)
	ld -shared -fPIC -o $(NAME) $(OBJ)

tests_run:
	gcc -o $(NAME_TESTS) $(OBJ_TESTS) $(LDFLAGS) $(LDLIBS)
	-./$(NAME_TESTS)
.PHONY: tests_run

clean:
	find -name "*.o" -delete
	find -name "*.gc*" -delete
.PHONY:	clean

fclean:	clean
	rm -f $(NAME)
	rm -f $(NAME_TESTS)
.PHONY:	fclean

re: fclean all
.PHONY:	re
