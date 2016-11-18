# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ggroener <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/09/28 11:16:22 by ggroener          #+#    #+#              #
#    Updated: 2016/10/05 14:21:45 by ggroener         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = npuzzle

CC = g++

CFLAGS = -Wall -Wextra -Werror -Ofast -flto -march=native -g3 -g

CFLAGS2 = -ltermcap

INCLUDES_PATH = includes/

SRCS_PATH = srcs/

SRCS_NAME = main.cpp \
			get_next_line.cpp \
			read_file.cpp \
			valid_int.cpp \
			dump_state.cpp \
			push_list_state.cpp \
			remove_list_state.cpp \
			astar.cpp \
			new_state.cpp \
			build_end.cpp \
			new_size_state.cpp \
			equals_state.cpp \
			list_contents_state.cpp \
			free_list_state.cpp \
			free_state.cpp \
			get_list_state.cpp \
			expend_state.cpp \
			copy_state.cpp \
			manhattan.cpp \
			generate_random.cpp \
			is_solvable.cpp \
			timing.cpp \
			print_solution.cpp \
			size_list_state.cpp \
			misplaced.cpp \
			row_column.cpp \
			cal_score_state.cpp \
			cost_state.cpp \
			push_closed_tree.cpp \
			get_closed_tree.cpp \
			remove_closed_tree.cpp \
			get_score.cpp \
			cpp_libft.cpp \
			term.cpp \

SRCS = $(addprefix $(SRCS_PATH), $(SRCS_NAME))

OBJS_PATH = objs/

OBJS_NAME = $(SRCS_NAME:.cpp=.o)

OBJS = $(addprefix $(OBJS_PATH), $(OBJS_NAME))

#uncomment these to work on Mac and comment to work on Linux.
LIBRARY = -lmlx -L libft/ -lft -framework OpenGL -framework AppKit

INCLUDES = -I includes/ -I libft/includes

#uncomment these to work on Linux and comment to work on Mac.
#LIBRARY = -L /usr/X11/lib -lmlx -lX11 -lm -lXext -L libft/ -lft
 
#INCLUDES = -I includes/ -I libft/includes -I /usr/X11/include

HEADER = 	$(INCLUDES_PATH)npuzzle.h 		\
			$(INCLUDES_PATH)define.h		\
			$(INCLUDES_PATH)includes.h		\
			$(INCLUDES_PATH)env.h			\
			$(INCLUDES_PATH)prototypes.h	\
			$(INCLUDES_PATH)state.h			\

all: qme odir $(NAME)

define colourecho
	@tput setaf 14
	@echo $1
	@tput sgr0
endef

define colourecho2
	@tput setaf 2
	@echo $1
	@tput sgr0
endef

$(NAME): $(OBJS)
	@Make -C libft
	@$(call colourecho, " - Making $(NAME)")
	@clear
	@$(CC) $(CFLAGS2) -o $(NAME) $^ $(LIBRARY) $(INCLUDES) -I$(INCLUDES_PATH)
	@clear
	@$(call colourecho, "Make Done!")

$(OBJS_PATH)%.o: $(SRCS_PATH)%.cpp
	@$(call colourecho, " - Compiling $<")
	@$(CC) $(CFLAGS) $(INCLUDES) -o $@ -c $< -I$(INCLUDES_PATH)
	@$(call colourecho, "Compiling Done!")

odir:
	@mkdir -p $(OBJS_PATH)

clean:
	@Make clean -C libft
	@$(call colourecho, " - Clearing object files")
	@rm -f $(OBJS)
	@$(call colourecho, "clean done!")

fclean: clean
	@Make fclean -C libft
	@$(call colourecho, "Clearing executable files")
	@rm -f $(NAME)
	@$(call colourecho, "fclean done")

re: fclean all
	@$(call colourecho, "re Done!")

format: norme me

norme: norm

norm:
	@clear
	@$(call colourecho2, "Norminette:")
	@norminette $(SRCS)
	@$(call colourecho2, "SRCS Files Done")
	@norminette $(HEADER)
	@$(call colourecho2, "Header Files Done!")

qme:
	@if [ ! -f author ]; then \
		echo ggroener > author; \
		echo khansman >> author; \
	fi
	
me: qme
	cat -e author

.PHONY: clean fclean re odir
