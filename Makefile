# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wonyang <wonyang@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/05 01:02:51 by wonyang           #+#    #+#              #
#    Updated: 2022/10/01 00:44:52 by wonyang          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		= $(wildcard *.c)

NAMES		= $(SRCS:%.c=%_res)

all	:		$(NAMES)

%_res	:	%.c
			cc -o $@ $^

clean	:
			rm -f $(NAMES)

re	:		
			make clean
			make all

.PHONY	:	all clean
