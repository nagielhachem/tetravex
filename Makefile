# Setting C++ compiler and flags
CPP = g++ 
CPPFLAGS= --std=c++11 

CPPLIBS = 

##############################################################################

# Sources

# Setting library files and dir
LDIR = lib
_LIB = 

LIB = $(parsubst %, $(LDIR)/%, $(_LIB))

# Setting src files and dir
SDIR = src
_SRC = main.cpp

SRC = $(patsubst %, $(SDIR)/%, $(_SRC))

##############################################################################

# Objects

ODIR = obj
_OBJ = $(_SRC:.cpp=.o)
_OBJ += $(_LIB:.cpp=.o)
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

##############################################################################
			######################################################

BIN = solver.out

all: $(BIN)
	
$(BIN): $(OBJ)
	$(CPP) $(CPPFLAGS) $(OBJ) $(CPPLIBS) -o $(BIN)

##############################################################################
			######################################################

$(ODIR)/main.o: $(SDIR)/main.cpp 
	$(CPP) $(CPPFLAGS) $(CPPLIBS) -c $< -o $@

##############################################################################

run: build
	$(EXEC) ./$(BIN)

clean:
	$(RM) $(OBJ) $(BIN) 

.PHONY: clean

##############################################################################