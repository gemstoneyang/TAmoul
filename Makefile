# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wonyang <wonyang@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/05 01:02:51 by wonyang           #+#    #+#              #
#    Updated: 2022/10/01 01:15:56 by wonyang          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCDIR		= ./srcs

RESDIR		= ./ress

STUDENT_NUM = student_num

SRCS		= $(wildcard $(SRCDIR)/*.c)

NAMES		= $(SRCS:%.c=%_res)

all	:
			@echo "source file compile"
			@make compile
			@echo "parse student number"
			@basename -s _res -a $(RESDIR)/* > $(STUDENT_NUM)

compile	:	$(NAMES)

%_res	:	%.c
			@cc -o $@ $^
			@mv $@ $(RESDIR)

clean	:
			@echo "result file clear"
			@rm -f $(NAMES)
			@rm -f $(STUDENT_NUM)

re	:		
			@make clean
			@make all

.PHONY	:	all clean compile re
