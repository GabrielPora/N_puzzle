
#include "npuzzle.h"

void	push_closed_tree(t_env *env, t_closed_tree *tree, t_state *state)
{
	t_closed_tree *lst;
	t_closed_tree *n;
	int size = env->size * env->size;
	int i;

	i = 0;
	lst = tree;
	while (i < size)
	{
		int nb = state->puzzle[i / 3][i % 3];
		if (lst->child[nb])
		{
			lst = lst->child[nb];
			++i;
			continue;
		}
		if (!(n = (t_closed_tree *)malloc(sizeof(*n))))
		{
			ft_putendl_fd("npuzzle: malloc failed", 2);
			exit(EXIT_FAILURE);
		}
		ft_bzero(n, sizeof(*n));
		if (!(n->child = (t_closed_tree **)malloc(sizeof(*n->child) * size)))
		{
			ft_putendl_fd("npuzzle: malloc failed", 2);
			exit(EXIT_FAILURE);
		}
		ft_bzero(n->child, sizeof(*n->child) * size);
		lst->child[nb] = n;
		lst = n;
		++i;
	}
	lst->state = state;
}
