# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fivieira <fivieira@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/10 15:53:34 by fivieira          #+#    #+#              #
#    Updated: 2023/08/14 18:22:24 by fivieira         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_CLIENT = client
NAME_SERVER = server

SRC_CLIENT = client.c 
SRC_SERVER = server.c

BONUS_NAME_CLIENT =
BONUS_NAME_SERVER = 

BONUS_OBJS = ${BONUS_NAME_CLIENT:.c=.o}
BONUS_OBJS = ${BONUS_NAME_SERVER:.c=.o}

OBJS_CLIENT = ${SRC_CLIENT:.c=.o}
OBJS_SERVER = ${SRC_SERVER:.c=.o}

INCLUDE = -I .

CC = cc

RM = rm -f

CFLAGS = -Wall -Wextra -Werror

MAKE = make -C

FT_PRINTF_PATH = ft_printf

FT_PRINTF = ${FT_PRINTF_PATH}/libftprintf.a

all:	${NAME_CLIENT} ${NAME_SERVER}


$(NAME_CLIENT): ${OBJS_CLIENT}
		$(MAKE) $(FT_PRINTF_PATH)
		$(CC) $(CFLAGS) $(SRC_CLIENT) -o $(NAME_CLIENT) $(FT_PRINTF) $(INCLUDE)

$(NAME_SERVER): ${OBJS_SERVER}
		$(MAKE) $(FT_PRINTF_PATH)
		$(CC) $(CFLAGS) $(SRC_SERVER) -o $(NAME_SERVER) $(FT_PRINTF) $(INCLUDE)	

clean:
		${MAKE} ${FT_PRINTF_PATH} clean
		${RM} ${OBJS_CLIENT}
		${RM} ${OBJS_SERVER} 

fclean: clean
		${MAKE} ${FT_PRINTF_PATH} fclean
		${RM} ${NAME_CLIENT}
		${RM} ${NAME_SERVER}

re: fclean all

.PHONY: all clean fclean re