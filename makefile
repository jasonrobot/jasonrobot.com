CC=crystal	

DEBUG_FLAGS := -debug

MAIN_FILE = src/main.cr
SRC_DIR := src
SRC_FILES := $(wildcard $(SRC_DIR)/*.cr)

TARGET := jasonrobot

LOCAL_BIN := ~/bin/
CONFIG_DIR := ~/.config/github-tracker/

build: $(SRC_FILES)
	$(CC) build $(MAIN_FILE) -o $(TARGET)

run: $(SRC_FILES)
	$(CC) run $(MAIN_FILE)
