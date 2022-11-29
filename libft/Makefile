# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dtelnov <dtelnov@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/24 04:45:01 by dtelnov           #+#    #+#              #
#    Updated: 2022/11/25 04:45:49 by dtelnov          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = cc
FLAGS = -Wall -Wextra -Werror
AR = ar rcs
RM = rm -f

FILES = ft_memset \
		ft_bzero \
		ft_memcpy \
		ft_strlen \
		ft_strlcpy \
		ft_isalpha \
		ft_isdigit \
		ft_isalnum \
		ft_isascii \
		ft_isprint \
		ft_toupper \
		ft_tolower \
		ft_strchr \
		ft_strrchr \
		ft_strncmp \
		ft_memchr \
		ft_memcmp \
		ft_strnstr \
		ft_atoi \
		ft_calloc \
		ft_strdup \
		ft_memmove \
		ft_strlcat \
		ft_substr \
		ft_strjoin \
		ft_strtrim \
		ft_itoa \
		ft_strmapi \
		ft_striteri \
		ft_putchar_fd \
		ft_putstr_fd \
		ft_putendl_fd \
		ft_split \
		ft_putnbr_fd

BONUS = ft_lstnew \
	  	ft_lstadd_front \
	  	ft_lstsize \
	  	ft_lstlast \
	  	ft_lstadd_back \
		ft_lstdelone \
		ft_lstclear \
		ft_lstiter \
		ft_lstmap

SRCS = $(addsuffix .c, $(FILES))
SRCS_B = $(addsuffix .c, $(BONUS))

OBJS = $(addsuffix .o, $(FILES))
OBJS_B = $(addsuffix .o, $(BONUS))

.c.o:
	$(CC) $(FLAGS) -c $< -o ${<:.c=.o}

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $@ $^

so:
	$(CC) -nostartfiles -fPIC $(FLAGS) $(SRCS) $(SRCS_B)
	gcc -nostartfiles -shared -o libft.so $(OBJS) $(OBJS_B)
	
bonus: $(OBJS_B)
	$(AR) $(NAME) $^


clean:
	$(RM) $(OBJS) $(OBJS_B)

fclean: clean
	$(RM) $(NAME)

re: clean all

.PHONY: bonus all clean fclean re
