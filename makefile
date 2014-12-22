CC = gcc
CFLAGS = -std=c99 -g
CXX = clang++
CXXFLAGS = -std=c++11 -g

PREFIX = ./build
PART1_SRC = ./part1
EXE = request_server.cgi
OBJS = request_server_cgi.o socket.o io_wrapper.o httplib.o

EXE_PATH = $(addprefix $(PREFIX)/, $(EXE))
OBJS_PATH = $(addprefix $(PREFIX)/, $(OBJS))

MAKE = make

# platform issue
UNAME = $(shell uname)
ifeq ($(UNAME), FreeBSD)
    MAKE = gmake
endif

all: $(EXE_PATH)

clean: 
	rm -f $(EXE_PATH) $(OBJS_PATH)

$(EXE_PATH): $(OBJS_PATH)
	$(CXX) -o $@ $(CXXFLAGS) $^

$(OBJS_PATH): $(PREFIX)/%.o: $(PART1_SRC)/%.cpp
	$(CXX) -o $@ $(CXXFLAGS) -c $<

.PHONY: all clean
