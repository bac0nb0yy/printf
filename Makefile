# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dtelnov <dtelnov@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/24 04:45:01 by dtelnov           #+#    #+#              #
#    Updated: 2023/07/16 22:57:11 by dtelnov          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
PROJECT_NAME = Printf

CC = cc
CFLAGS = -Wall -Wextra -Werror -I includes/ -fPIE
AR = ar rcss
RM = rm -f

# Reset
NC = \033[0m

# Colors
YELLOW = \033[0;33m
GREEN = \033[0;32m
BLUE = \033[0;34m
RED = \033[0;31m
PURPLE = \033[0;35m
CYAN = \033[0;36m
BLACK = \033[0;30
WHITE = \033[0;37m

# Colors
BYELLOW = \033[1;33m
BGREEN = \033[1;32m
BBLUE = \033[1;34m
BRED = \033[1;31m
BPURPLE = \033[1;35m
BCYAN = \033[1;36m
BBLACK = \033[1;30m
BWHITE = \033[1;37m

FILES = ft_add \
		ft_argjoin \
		len_nums \
		len_str \
		utils \

SRCS = $(addsuffix .c, $(addprefix sources/, $(FILES)))

OBJS = $(SRCS:.c=.o)

TOTAL = $(words $(SRCS))
COUNT = 0

all: $(NAME)

$(NAME): $(OBJS)
	@echo "\n\n[🔘] $(BGREEN)Compiling $(PROJECT_NAME)..."
	@$(AR) $(NAME) $^
	@echo "$(NC)"
	@printf "$(BBLACK)[%1d/%1d] 100%%\t$(BWHITE)All files have been compiled ✔️$(NC)\n" $(COUNT) $(TOTAL)
	@echo "[💠] $(BBLACK)$(NAME)\t$(BWHITE)Library created ✔️\n$(NC)"

%.o: %.c
	@printf "[🔄] $(BPURPLE)Generating $(PROJECT_NAME) objects... %-33.33s\r$(NC)" $@
	@${CC} ${CFLAGS} -c $< -o $@
	@$(eval COUNT=$(shell echo $$(($(COUNT)+1))))
	@$(eval PERCENT:=$(shell echo $$((100*$(COUNT)/$(TOTAL)))))

bonus: all

clean:
	@$(RM) $(OBJS)
	@echo "[🧼] $(BYELLOW)Objects $(YELLOW)files have been cleaned from $(PROJECT_NAME) ✔️$(NC)"

fclean: clean
	@$(RM) $(NAME)
	@echo "[🗑️ ] $(BRED)All $(RED)files have been cleaned ✔️$(NC)"

re: clean all

.PHONY: bonus all clean fclean re
