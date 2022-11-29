# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dtelnov <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/28 02:06:28 by dtelnov           #+#    #+#              #
#    Updated: 2022/11/28 02:06:29 by dtelnov          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libftprintf.a
INCDIR	=	./
SRCDIR	=	srcs
OBJDIR	=	objs
LIBFT	=	libft

# Files
SRCS	:=	ft_printf.c \
			ft_printf_utils.c \
			ft_printf_nums.c \
			ft_printf_str.c

OBJS	:=	$(SRCS:.c=.o)
SRCS	:=	$(addprefix $(SRCDIR)/, $(SRCS))
OBJS	:=	$(addprefix $(OBJDIR)/, $(OBJS))

# Compiler options
CC		=	cc
CFLAGS	=	-Wall -Wextra -Werror -I./$(INCDIR) -I./$(LIBFT)

# Other
RM		= rm -rf
AR		= ar rcs

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJDIR) $(OBJS)
	make -C $(LIBFT)
	cp $(LIBFT)/libft.a $(NAME)
	$(AR) $(NAME) $(OBJS)

$(OBJDIR):
	mkdir -p $(OBJDIR)

bonus: all

clean:
	$(RM) $(OBJS)
	make clean -C $(LIBFT)

fclean: clean
	$(RM) $(NAME)
	$(RM) $(LIBFT)/libft.a

re: fclean all

.PHONY: all re clean fclean
