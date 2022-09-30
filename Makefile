# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wonyang <wonyang@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/05 01:02:51 by wonyang           #+#    #+#              #
#    Updated: 2022/10/01 01:02:41 by wonyang          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCDIR		= ./srcs

RESDIR		= ./ress

SRCS		= $(wildcard $(SRCDIR)/*.c)

NAMES		= $(SRCS:%.c=%_res)

all	:
			@echo "source file compile"
			@make compile

compile	:	$(NAMES)

%_res	:	%.c
			@cc -o $@ $^
			@mv $@ $(RESDIR)

clean	:
			@echo "result file clear"
			@rm -f $(NAMES)

re	:		
			@make clean
			@make all

.PHONY	:	all clean compile re
