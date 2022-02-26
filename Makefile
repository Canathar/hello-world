#!/usr/bin/make -f
#
#  __  __       _         __ _ _
# |  \/  | __ _| | _____ / _(_) | ___ _
# | |\/| |/ _` | |/ / _ \ |_| | |/ _ (_)
# | |  | | (_| |   <  __/  _| | |  __/_
# |_|  |_|\__,_|_|\_\___|_| |_|_|\___(_)
#
#  _          _ _                               _     _
# | |__   ___| | | ___      __      _____  _ __| | __| |
# | '_ \ / _ \ | |/ _ \ ____\ \ /\ / / _ \| '__| |/ _` |
# | | | |  __/ | | (_) |_____\ V  V / (_) | |  | | (_| |
# |_| |_|\___|_|_|\___/       \_/\_/ \___/|_|  |_|\__,_|
#

# Set the default shell in case we were called form a different shell
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


# C/C++ Linker flags
LDFLAGS =


# Include information
# https://www.gnu.org/software/make/manual/html_node/Flavors.html
INCLUDE_PATH := include
INCLUDES     :=


# Source information
# https://www.gnu.org/software/make/manual/html_node/Flavors.html
SRC_PATH := src
SRCS     := main.cpp
#$(info SRCS: $(SRCS))


# Object files
# https://www.gnu.org/software/make/manual/html_node/Flavors.html
# https://www.gnu.org/software/make/manual/html_node/Text-Functions.html
OBJ_PATH := obj
OBJS     := $(SRCS:.cpp=.o)
#$(info OBJS: $(OBJS))


# Output information
# https://www.gnu.org/software/make/manual/html_node/Flavors.html
BIN_PATH := bin
BIN      := hello-world


# The default goal is the target of the first rule in the makefile
# https://www.gnu.org/software/make/manual/html_node/Rules.html
# NOTE: As this is the default goal in the Makefile, this is the goal executed when make is called without arguments
.PHONY:	all
all:		$(BIN)


# Take all source files and compile them to create object files
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
$(OBJS):	$(SRC_PATH)/$(SRCS)
			@echo "Compiling: $@"
			$(CXX) $(CXXFLAGS) $(INCLUDES) -c $^ -o $(OBJ_PATH)/$@


# Create the executable by linking all the object files
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
$(BIN):	$(OBJS)
			@echo "Linking: $@"
			$(CXX) $(OBJ_PATH)/$(OBJS) -o $(BIN_PATH)/$@ $(LDFLAGS)


# Remove the executable and the build artifacts
.PHONY:	clean
clean:
			@rm -f $(OBJ_PATH)/*
			@rm -f $(BIN_PATH)/*

