# ===== Configuración =====
CC = gcc
CFLAGS = -Wall -Wextra -std=c11
TARGET = main
SRC = main.c

# ===== Regla por defecto =====
all: $(TARGET)

# ===== Compilación =====
$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

# ===== Ejecutar =====
run: $(TARGET)
	./$(TARGET)

# ===== Debug =====
debug: CFLAGS += -g
debug: clean $(TARGET)

# ===== Limpiar =====
clean:
	rm -f $(TARGET) $(TARGET).exe