#!/usr/bin/make -f

SHELL = /bin/sh

# C/C++ compiler
CPP = gcc
CXX = g++

# C/C++ Compiler flags
#
# This variable is for extra flags to give to the C++ compiler.
# https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
# https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
# https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html
#
#  -std=<standard>   Various C/C++ standards. A few are listed below:
#                       c90, c99, c++98, c++11, c++14, c++17
#  -Wpedantic        Turns on all the warnings demanded by strict ISO C++
#  -Wall             Turns on all warning flags
#  -Wextra           Turns on extra warning flags
#  -g                Produce debugging information
CPPFLAGS = -std=c99 -Wpedantic -Wall -Wextra -g
CXXFLAGS = -std=c++98 -Wpedantic -Wall -Wextra -g

# Include files
INCLUDE_PATH = include
INCLUDES =

# Find all source files
SRC_EXT = cpp
SRC_PATH = src
SRCS = main.cpp

# Object files
OBJ_PATH = obj
OBJS = main.o

# Output executable
BIN_PATH = bin
BIN = hello

# The default goal is the target of the first rule in the makefile
# https://www.gnu.org/software/make/manual/html_node/Rules.html
# NOTE: As this is the default goal in the Makefile, this is the goal executed when make is called without arguments
.PHONY:	all
all:		$(BIN)

# Take all source files and compile them to create object files
$(OBJS):	$(SRC_PATH)/$(SRCS)
			@echo "Compiling: $@"
			$(CXX) $(CXXFLAGS) $(INCLUDES) -c $^ -o $(OBJ_PATH)/$@

# Create the executable by linking all the object files
$(BIN):	$(OBJS)
			@echo "Linking: $@"
			$(CXX) $(OBJ_PATH)/$(OBJS) -o $(BIN_PATH)/$@ $(LDFLAGS)

# Remove the executable and the build artifacts
.PHONY:	clean
clean:
			@rm -f $(OBJ_PATH)/*
			@rm -f $(BIN_PATH)/*

