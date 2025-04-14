# Compiler
CC = g++
TARGET = student

all: $(TARGET)

$(TARGET): student.cpp
	$(CC) student.cpp -o $(TARGET)

clean:
	rm -f $(TARGET)

test: $(TARGET)
	bash test.sh

