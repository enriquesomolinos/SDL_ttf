# SDL_mixer-VITA port by enrique.somolinos

TARGET_LIB = libSDL2_ttf.a
OBJS= SDL_ttf.o 

PREFIX  = arm-vita-eabi
CC      = $(PREFIX)-gcc
AR      = $(PREFIX)-gcc-ar
CFLAGS  = -Wl,-q -Wall -O3 -Iinclude -IC:\PSDK3v3\MinGW\msys\1.0\local\vitasdk\arm-vita-eabi\include\freetype2 -IC:\PSDK3v3\MinGW\msys\1.0\local\vitasdk\arm-vita-eabi\include\SDL2_ttf
ASFLAGS = $(CFLAGS)

LIBS +=  -lSDL2   -lfreetype

$(TARGET_LIB): $(OBJS)
	$(AR) rcs $@ $^ 

clean:
	@rm -rf $(TARGET_LIB) $(OBJS)

	
install: $(TARGET_LIB)
	@cp  $(TARGET_LIB) $(VITASDK)/arm-vita-eabi/lib
	@mkdir -p "$(VITASDK)/arm-vita-eabi/include/SDL2_ttf"
	@cp *.h "$(VITASDK)/arm-vita-eabi/include/SDL2_ttf"
	


