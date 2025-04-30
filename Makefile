# Makefile for safegets - intentionally unsafe demo library

CC = gcc
CFLAGS = -Wall -Wextra -O2 -Iinclude
LDFLAGS = 
SRC_DIR = src
INC_DIR = include
OBJ_DIR = build
EXAMPLES_DIR = examples

TARGET_LIB = libsafegets.a
EXAMPLE_BIN = test_safegets

SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))

.PHONY: all clean example install uninstall

all: $(TARGET_LIB)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET_LIB): $(OBJ_FILES)
	ar rcs $@ $^

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

example: all
	$(CC) $(CFLAGS) -o $(EXAMPLE_BIN) $(EXAMPLES_DIR)/test_safegets.c $(TARGET_LIB)

install: all
	mkdir -p /usr/local/include/safegets
	cp $(INC_DIR)/safegets.h /usr/local/include/safegets/
	cp $(TARGET_LIB) /usr/local/lib/
	@echo "Installed libsafegets.a and headers to /usr/local"

uninstall:
	rm -f /usr/local/lib/$(TARGET_LIB)
	rm -rf /usr/local/include/safegets
	@echo "Uninstalled libsafegets.a and headers"

clean:
	rm -rf $(OBJ_DIR) $(TARGET_LIB) $(EXAMPLE_BIN)
