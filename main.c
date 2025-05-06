#define _GNU_SOURCE 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <malloc.h>
#include <sys/resource.h>


#define NC "\e[0m"
#define RED "\e[1;31m"
#define GREEN "\e[1;32m"
#define YELLOW "\e[1;33m"
#define ORANGE "\e[1;34m"
#define PURPLE "\e[1;35m"
#define BLUE "\e[1;36m"

#define FILE_TEST open("test_file.txt", O_RDONLY)
#define WRONG_FILE open("wrong_file.txt", O_RDONLY)
#define WRONG_FD -1
#define FD_TEST 1
#define SRC "coucou\n"
#define RESET errno=0;printf("\n");
#define TITLE(string) printf("%s\n\n----%s----\n\n%s", RED, string, NC);
#define BUFFER_SIZE 10
#define BINAIRE "01"
#define HEXA "0123456789ABCDEF"
#define TEN "0123456789"
#define WTF "abcdef"

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

// void hello(void);
int ft_strlen(const char *str);
char *ft_strcpy(char * dest, char * const src);
char *ft_strdup(char * const src);
int ft_strcmp(char * dest, char * const src);
int ft_write(int fd, char * const src, int len);
int ft_read(int fd, char * buffer, int len);

void marche() {

	int fd_test = FILE_TEST;
	// int fd_crashtest = WRONG_FILE;

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

	TITLE("Read");

	char * my_read_buffer = calloc(BUFFER_SIZE, sizeof(char));
	char * read_buffer = calloc(BUFFER_SIZE, sizeof(char));
	color = PURPLE;
	printf("%s", color);
	RESET;
	printf("retour de read: %zd\nErrno: %d: %s\n", read(fd_test, read_buffer, BUFFER_SIZE), errno, strerror(errno));
	RESET;
	printf("contenu du buffer de read: %s\n\n", read_buffer);
	RESET;
	printf("retour de ft_read: %d\nErrno: %d: %s\n", ft_read(fd_test, my_read_buffer, BUFFER_SIZE), errno, strerror(errno));
	RESET;
	printf("contenu du buffer de ft_read: %s\n\n", my_read_buffer);
	RESET;
	printf("retour de ft_read: %d\nErrno: %d: %s\n", ft_read(WRONG_FD, my_read_buffer, sizeof(my_read_buffer)), errno, strerror(errno));
	RESET;
	printf("contenu du buffer de ft_read: %s\n\n", my_read_buffer);
	RESET;
	printf("retour de read: %zd\nErrno: %d: %s\n", read(WRONG_FD, read_buffer, sizeof(read_buffer)), errno, strerror(errno));
	RESET;
	printf("contenu du buffer de read: %s\n\n%s", read_buffer, NC);
	RESET;


	TITLE("Strdup");

	color = RED;
	printf("%s", color);
	RESET;
	char *result = ft_strdup(SRC);
	printf("retour de ft_strdup: %s\nErrno: %d: %s\n", result, errno, strerror(errno));
	RESET;
	free(result);
	result = strdup(SRC);
	printf("retour de strdup: %s\nErrno: %d: %s\n", result, errno, strerror(errno));
	RESET;
	free(result);

	free(dest);
	free(my_read_buffer);
	free(read_buffer);
}

//main pour test le crash de malloc

void crash() {
	
	struct rlimit rl = { .rlim_cur = 0, .rlim_max = 0 };
	
	if (setrlimit(RLIMIT_DATA, &rl) < 0) {
		perror("setrlimit(RLIMIT_DATA)");
		return ;
	}
	
	mallopt(M_MMAP_MAX, 0);
	char *color = BLUE;


	TITLE("Strdup");

	color = RED;
	printf("%s", color);
	RESET;
	char *result = ft_strdup(SRC);
	printf("retour de ft_strdup: %s\nErrno: %d: %s\n", result, errno, strerror(errno));
	RESET;
	free(result);
	result = strdup(SRC);
	printf("retour de strdup: %s\nErrno: %d: %s\n", result, errno, strerror(errno));
	RESET;
	free(result);
}

int ft_atoi_base(char *src, char *base);
t_list *ft_list_push_front(t_list **head, void *data);
int ft_list_size(t_list *head);
t_list *ft_list_sort(t_list **head, int (*ft_strcmp)());


void bonus() {
	TITLE("Atoi_base");

	char *color = GREEN;
	printf("%s", color);
	RESET;
	char *number = "11";
	printf("retour de ft_atoi_base: %d\n%s", ft_atoi_base(number, HEXA), NC);

	TITLE("List_push_front");

	color = BLUE;
	printf("%s", color);
	RESET;
	t_list **head = NULL;//malloc(sizeof(t_list));
	// head->data = "caca";
	// head->next = NULL;
	// void *data = "prout";
	// t_list *front = *head;
	// while (front) {
	// 	printf("Data in node before push front: %s\n", (char *)front->data);
	// 	front = front->next;
	// }
	// printf("\n");
	write(1,"before",7);
	if (!ft_list_push_front(head, "data"))
		printf("return null");
	printf ("return pas null");
	// front = ft_list_push_front(head, "pipi");
	t_list *tmp = *head;
	while (tmp) {
		printf("Data in node after push front: %s\n", (char *)tmp->data);
		tmp = tmp->next;
	}
	// printf("%s", NC);
	// TITLE("List_size");

	// color = GREEN;
	// printf("%s", color);
	// RESET;
	// printf("Retour de lst size: %d\n%s", ft_list_size(head), NC);

	// TITLE("List_sort");

	// color = GREEN;
	// printf("%s", color);
	// RESET;
	// front = head;
	// while (front) {
	// 	printf("apres lst sort: %s\n%s", (char *)front->data, NC);
	// 	front = front->next;
	// }
	// ft_list_sort(&head, &ft_strcmp);
	// front = head;
	// while (front) {
	// 	printf("apres lst sort: %s\n%s", (char *)front->data, NC);
	// 	front = front->next;
	// }


	// while (head) {
	// 	t_list *tmp = head;
	// 	head = head->next;
	// 	free(tmp);
	// }
}

int main(int argc, char **argv) {
	(void)argv;
	if (argc == 1)
		marche();
	else if (!strcmp(argv[1], "crash"))
		crash();
	else {
		bonus();
	}
	return 0;
}