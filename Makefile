# =============================
# Configuración
# =============================

CC      = gcc
CFLAGS  = -Wall -Wextra -O2 -std=c11
DEBUGFLAGS = -g -DDEBUG
TARGET  = reines
SRC     = reines.c

# =============================
# Regla por defecto
# =============================

all: $(TARGET)

# =============================
# Compilación normal
# =============================

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

# =============================
# Compilación modo debug
# =============================

debug: CFLAGS += $(DEBUGFLAGS)
debug: clean $(TARGET)

# =============================
# Ejecutar (requiere argumento)
# Ejemplo: make run ARGS=8
# =============================

run: $(TARGET)
	@if [ -z "$(ARGS)" ]; then \
		echo "Uso: make run ARGS=<num_reinas>"; \
	else \
		./$(TARGET) $(ARGS); \
	fi

# =============================
# Limpiar
# =============================

clean:
	rm -f $(TARGET) $(TARGET).exe