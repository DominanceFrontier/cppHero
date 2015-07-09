# Compiler for the system. For our purposes, standard g++
CC = g++

# Any relevant options for compilation. Maybe -Wall?
CPPFLAGS = -g `sdl2-config --cflags --libs`

LIBS = -lSDL2_image -lSDL2_ttf -lSDL2_net

# The directory where your source code exists
SRCDIR = .

# The directory where the object files are stored (to be stored, actually.)
# This is the same directory as the SRCDIR for now.
OBJDIR = $(SRCDIR)

# List of all objects that this makefile is concerned with.
# Anything not immediately related to server or client is here for now ???.
OBJECTS = Game.o

# The main workhorse of the makefile. Builds all the object files.
build: $(addprefix $(OBJDIR)/, $(OBJECTS))
	$(CC) $(CPPFLAGS) main.cpp *.o $(LIBS) -o main.exe

# Just individual compilation of all objects.
$(addprefix $(OBJDIR)/, $(OBJECTS)): %.o: %.cpp
	$(CC) -c $(CPPFLAGS) $< -o $@

# Cleans all the object files and executables.
.PHONY: clean
clean:
	rm -f *.o *.exe *~ \#*
c:	clean

run:	main.exe
	./main.exe
r:	run
