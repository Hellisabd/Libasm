#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <unistd.h>


#define NC "\e[0m"
#define RED "\e[1;31m"
#define GREEN "\e[1;32m"
#define YELLOW "\e[1;33m"
#define ORANGE "\e[1;34m"
#define PURPLE "\e[1;35m"
#define BLUE "\e[1;36m"

#define WRONG_FD -1
#define FD_TEST 1
#define SRC "coucou\n"
#define RESET errno=0;printf("\n");
#define TITLE(string) printf("%s\n\n----%s----\n\n%s", RED, string, NC);


// void hello(void);
int ft_strlen(const char *str);
char *ft_strcpy(char * dest, char * const src);
int ft_strcmp(char * dest, char * const src);
int ft_write(int fd, char * const src, int len);

int main() {

	char *dest = malloc(100000);
	char *color = BLUE;

	TITLE("Strlen");

	printf("%sMon strlen: %d\n%s", color, ft_strlen(SRC), NC);
	RESET;
	printf("%sVrai strlen: %lu\n%s", color, strlen(SRC), NC);
	RESET;
	
	TITLE("Strcpy");

	color = GREEN;
	RESET;
	printf("%sretour de ft_strcpy: %s\nErrno: %d: %s\n%s", color, ft_strcpy(dest, SRC), errno, strerror(errno), NC);
	RESET;
	printf("%spas le retour mais juste dest: %s\nErrno: %d: %s\n%s", color, dest, errno, strerror(errno), NC);

	TITLE("Strcmp");
	color = YELLOW;
	RESET;
	printf("%sretour de ft_strcmp: %d\nErrno: %d: %s\n%s", color, ft_strcmp(dest, SRC), errno, strerror(errno), NC);
	RESET;
	printf("%sretour de strcmp: %d\nErrno: %d: %s\n%s", color, strcmp(dest, SRC), errno, strerror(errno), NC);
	
	TITLE("Write");

	color = PURPLE;
	printf("%s", color);
	RESET;
	printf("retour de write: %zd\nErrno: %d: %s\n", write(FD_TEST, SRC, ft_strlen(dest)), errno, strerror(errno));
	RESET;
	printf("retour de ft_write: %d\nErrno: %d: %s\n", ft_write(FD_TEST, SRC, ft_strlen(dest)), errno, strerror(errno));
	RESET;
	printf("retour de write: %zd\nErrno: %d: %s\n", write(WRONG_FD, dest, ft_strlen(dest)), errno, strerror(errno));
	RESET;
	printf("retour de ft_write: %d\nErrno: %d: %s\n%s", ft_write(WRONG_FD, dest, ft_strlen(dest)), errno, strerror(errno), NC);



	free(dest);
}