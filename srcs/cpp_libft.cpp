#include "npuzzle.h"

void		print_fd(string str, int fd) {
	const char	*s = str.c_str();
	write(fd, s, str.length());
}

void		print(string str) {
	print_fd(str, 1);
}