# Compiler
CC = g++
TARGET = person

all: $(TARGET)

$(TARGET): person.cpp
	$(CC) person.cpp -o $(TARGET)

clean:
	rm -f $(TARGET)

test: $(TARGET)
	bash test.sh


