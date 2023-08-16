# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fivieira <fivieira@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/10 15:53:34 by fivieira          #+#    #+#              #
#    Updated: 2023/08/16 15:11:59 by fivieira         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_CLIENT = client
NAME_SERVER = server

SRC_CLIENT = client.c 
SRC_SERVER = server.c

OBJS_CLIENT = ${SRC_CLIENT:.c=.o}
OBJS_SERVER = ${SRC_SERVER:.c=.o}

#BONUS

BONUS_NAME_CLIENT = client_bonus
BONUS_NAME_SERVER = server_bonus

SRC_BONUS_CLIENT = client_bonus.c 
SRC_BONUS_SERVER = server_bonus.c

OBJS_BONUS_CLIENT = ${SRC_BONUS_CLIENT:.c=.o}
OBJS_BONUS_SERVER = ${SRC_BONUS_SERVER:.c=.o}

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

#BONUS

bonus : ${BONUS_NAME_CLIENT} ${BONUS_NAME_SERVER} 


$(BONUS_NAME_CLIENT): ${OBJS_BONUS_CLIENT}
		$(MAKE) $(FT_PRINTF_PATH)
		$(CC) $(CFLAGS) $(SRC_BONUS_CLIENT) -o $(BONUS_NAME_CLIENT) $(FT_PRINTF) $(INCLUDE)

$(BONUS_NAME_SERVER): ${OBJS_BONUS_SERVER}
		$(MAKE) $(FT_PRINTF_PATH)
		$(CC) $(CFLAGS) $(SRC_BONUS_SERVER) -o $(BONUS_NAME_SERVER) $(FT_PRINTF) $(INCLUDE)	


clean:
		${MAKE} ${FT_PRINTF_PATH} clean
		${RM} ${OBJS_CLIENT}
		${RM} ${OBJS_SERVER} 
		${RM} ${OBJS_BONUS_CLIENT}
		${RM} ${OBJS_BONUS_SERVER} 

fclean: clean
		${MAKE} ${FT_PRINTF_PATH} fclean
		${RM} ${NAME_CLIENT}
		${RM} ${NAME_SERVER}
		${RM} ${BONUS_NAME_CLIENT}
		${RM} ${BONUS_NAME_SERVER}

re: fclean all

.PHONY: all bonus clean fclean re