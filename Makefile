MAKEFLAGS += -s

ASM     = nasm -f elf64
AR      = ar rcs
CC      = cc
CFLAGS  = -Wall -Wextra -g3


SRC_ASM = hello.s ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s
OBJ_ASM = $(SRC_ASM:.s=.o)

SRC_C   = main.c
OBJ_C   = main.o


NAME    = libasm.a
BIN     = a.out


all: $(NAME) $(BIN)

%.o: %.s
	@echo "→ Assembler $<"
	@$(ASM) -o $@ $<


$(NAME): $(OBJ_ASM)
	@echo "→ Archivage $@"
	@$(AR) $@ $^


$(BIN): $(OBJ_C) $(NAME)
	@echo "→ Compilation et linkage de $@"
	@$(CC) $(CFLAGS) -o $@ $(OBJ_C) -L. -lasm


clean:
	@echo "→ clean"
	@rm -f $(OBJ_ASM) $(OBJ_C)

fclean: clean
	@echo "→ fclean"
	@rm -f $(NAME) $(BIN)
git	: fclean
	@git add . > /dev/null 2>&1
	@@msg=$${MSG:-"$(CURRENT_DATE)"}; git commit -m "$(USER) $(CURRENT_DATE) $$msg" > /dev/null 2>&1
	@git push > /dev/null 2>&1
	@echo "$(GREEN)(•̀ᴗ•́)و ̑̑GIT UPDATE!(•̀ᴗ•́)و ̑̑$(DEF_COLOR)"

gdb: all
	gdb -x show.gdb ./a.out
