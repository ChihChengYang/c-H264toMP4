
# COMPILER FLAGS
CC = gcc
CCPLUS = g++  
 
CFLAGS = -Wall -pedantic -lpthread -fpermissive
 
OUTPUT_PATH = ./bin/ 
LIBS_PATH = ./libs/

LIBS = -ldl -L$(LIBS_PATH)ffmpeg/ -lx264 -lavcodec -lswscale -lavutil -lswresample -lavformat  

INC_PATH = -I$(LIBS_PATH)ffmpeg/ 
  
DEBUG = 0
ifeq ($(DEBUG),1)
	OPTIMIZEFLAG = -g
else
	OPTIMIZEFLAG = -O3  
endif

# OBJECTS
VAFF_OBJECTS = va_ff.c 
VAFF_OUTPUT = libvaff.so
VAFF_LIB = -L$(LIBS_PATH) -lvaff
 

SERVER_OBJECTS = server.c   
SERVER_OUTPUT = Server
 
 
all:	vafflib server
 
vafflib: $(VAFF_OBJECTS)
	$(CCPLUS)  $(INC_PATH) $(CFLAGS) $(OPTIMIZEFLAG) -fPIC -shared -o $(VAFF_OUTPUT) $(VAFF_OBJECTS) $(LIBS)  
	cp ./$(VAFF_OUTPUT) /usr/lib/
	mv ./$(VAFF_OUTPUT) $(LIBS_PATH)
	ldconfig


server: $(SERVER_OBJECTS)    
	$(CCPLUS)  $(INC_PATH) $(CFLAGS) $(OPTIMIZEFLAG) -o $(SERVER_OUTPUT) $(SERVER_OBJECTS) $(VAFF_LIB)
	mv ./$(SERVER_OUTPUT) $(OUTPUT_PATH)

	
clean:
	rm -rf $(OUTPUT_PATH)$(SERVER_OUTPUT) 
 