CC = g++
CFLAGS = -std=c++17
SRC = src/main.cpp src/helpers.cpp src/orderbook.cpp
UNIT_TEST_SRC = src/unit_tests.cpp src/helpers.cpp src/orderbook.cpp
BUILD_DIR = build
OBJ = $(SRC:src/%.cpp=$(BUILD_DIR)/%.o)
UNIT_TEST_OBJ = $(UNIT_TEST_SRC:src/%.cpp=$(BUILD_DIR)/%.o)
TARGET = $(BUILD_DIR)/main
UNIT_TEST_TARGET = build/unit_tests

# Default target builds both main program and unit tests
all: $(TARGET) $(UNIT_TEST_TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Linking the main executable
$(TARGET): $(OBJ) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $@ $(OBJ)

# Linking the unit tests executable
$(UNIT_TEST_TARGET): $(UNIT_TEST_OBJ) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $@ $(UNIT_TEST_OBJ)

# Compiling source files
$(BUILD_DIR)/%.o: src/%.cpp | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up
clean:
	rm -rf $(BUILD_DIR)

# Phony target to prevent conflicts with file names
.PHONY: all clean
