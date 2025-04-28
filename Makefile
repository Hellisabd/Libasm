MAKEFLAGS += -s

NAME = libasm.a


CURRENT_DATE	:= $(shell date +"%Y-%m-%d %H:%M:%S")

DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

RM	= @rm -rf

SRC = hello.s

OBJS = $(SRC:.s=.o)

TRANSFORMATION = nasm -f elf64 $(SRC) -o $(OBJS)

ARCHIVE = ar rcs libasm.a $(OBJS)

COMPILATION = cc -L. -lasm -Wall -Wextra -Werror main.c libasm.a

EXEC = ./a.out

all : 
	$(TRANSFORMATION)
	$(ARCHIVE)
	$(COMPILATION)
	$(EXEC)

clean :
	$(RM) *.o

fclean :
	$(RM) *.o libasm.a a.out
git	: fclean
	@git add . > /dev/null 2>&1
	@@msg=$${MSG:-"$(CURRENT_DATE)"}; git commit -m "$(USER) $(CURRENT_DATE) $$msg" > /dev/null 2>&1
	@git push > /dev/null 2>&1
	@echo "$(GREEN)(•̀ᴗ•́)و ̑̑GIT UPDATE!(•̀ᴗ•́)و ̑̑$(DEF_COLOR)"
