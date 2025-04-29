#include <stdio.h>
#include <stdlib.h>

void hello(void);
int ft_strlen(const char *str);
char *ft_strcpy(char * dest, char * const src);

int main() {
	char *dest = malloc(100000);
	// printf("%d", ft_strlen("caca\n"));
	printf("retour de ft_strcpy: %s\n", ft_strcpy(dest, "caca"));
	free(dest);
}