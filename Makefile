# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wonyang <wonyang@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/05 01:02:51 by wonyang           #+#    #+#              #
#    Updated: 2022/10/01 15:12:57 by wonyang          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCDIR		= ./srcs
RESDIR		= ./res
INPUTDIR	= ./input
OUTPUTDIR	= ./output

STUDENT_NUM = student_num
TESTCASE	= testcase
TCPROGRAM	= parse.py

SRCS		= $(wildcard $(SRCDIR)/*.c)
NAMES		= $(SRCS:%.c=%_res)

all	:
			@echo "source file compile"
			@make compile
			@echo "parse student number"
			@make parse
			@echo "make testcase"
			@make tc

compile	:	$(NAMES)

%_res	:	%.c
			@cc -o $@ $^
			@mv $@ $(RESDIR)

parse :		$(STUDENT_NUM)

$(STUDENT_NUM) :
			@basename -s _res -a $(RESDIR)/* > $(STUDENT_NUM)


tc 		:  $(TESTCASE) $(TCPROGRAM)
			@python3 parse.py < testcase

clean	:
			@echo "file clear"
			@rm -f $(RESDIR)/*
			@rm -f $(STUDENT_NUM)
			@rm -f $(INPUTDIR)/*
			@rm -f $(OUTPUTDIR)/*

re	:		
			@make clean
			@make all

.PHONY	:	all clean re compile parse tc
