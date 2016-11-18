#include "npuzzle.h"

int		cursor_do(int to_print) {
	write(1, &to_print, 1);
	return (to_print);
}

void	unexpected_error(int signo) {
	if (signo == 11) {
		tputs(tgetstr((char *)"up", NULL), 0, cursor_do);
		tputs(tgetstr((char *)"cr", NULL), 0, cursor_do);
		print("                                                            ");
		tputs(tgetstr((char *)"cr", NULL), 0, cursor_do);
		print("\rPuzzle is not solvable.\n");
		exit(0);
	}
}

void	listener(void) {
	signal(11, unexpected_error);
}
