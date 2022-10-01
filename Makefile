# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wonyang <wonyang@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/05 01:02:51 by wonyang           #+#    #+#              #
#    Updated: 2022/10/01 18:42:08 by wonyang          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCDIR		= ./srcs
RESDIR		= ./res
INPUTDIR	= ./input
OUTPUTDIR	= ./output
LOGDIR		= ./logs

TESTCASE	= testcase
TCPROGRAM	= parse.py
TESTER		= grade.sh

SRCS		= $(wildcard $(SRCDIR)/*.c)
NAMES		= $(SRCS:%.c=%_res)

all	:
			@echo "\033[36;1m[ SOURCE FILE COMPILE ]\033[0m"
			@make compile
			@echo "\033[36;1m[ MAKE TEST CASE ]\033[0m"
			@make tc
			@echo "\033[36;1m[ GRADE FILE ]\033[0m"
			@make grade

compile	:	$(NAMES)
			@echo "\033[34;1mDONE!\033[0m"

%_res	:	%.c
			@cc -o $@ $^
			@mv $@ $(RESDIR)


tc 		:  $(TESTCASE) $(TCPROGRAM)
			@python3 parse.py < testcase
			@echo "\033[34;1mDONE!\033[0m"

grade	:	$(TESTER)
			@bash ./$(TESTER)
			@echo "\033[34;1mDONE!\033[0m"

clean	:
			@echo "\033[36;1m[ FILE CLEAR ]\033[0m"
			@rm -f $(RESDIR)/*
			@rm -f $(TESTCASE)
			@rm -f $(STUDENT_NUM)
			@rm -f $(INPUTDIR)/*
			@rm -f $(OUTPUTDIR)/*
			@rm -f $(LOGDIR)/*
			@echo "\033[34;1mDONE!\033[0m"

re	:		
			@make clean
			@make all

.PHONY	:	all clean re compile tc grade
