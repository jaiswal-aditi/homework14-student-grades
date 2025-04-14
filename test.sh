#!/bin/bash

echo "Running tests..."
echo

./student < test/input.txt > test/actual_output.txt

# Normalize the output (remove spaces, newlines, etc.)
normalized_output=$(grep -E "Name:|Class:|Roll|Marks:|Grade:" test/actual_output.txt | tr -d '[:space:]')
expected=$(tr -d '[:space:]' < test/expected_output.txt)

if [ $? -eq 0 ]; then
  echo "✅ Program exited successfully"
else
  echo "❌ Program did not exit cleanly"
  exit 1
fi

if [[ "$normalized_output" == "$expected" ]]; then
  echo "✅ Test passed"
else
  echo "❌ Test failed"
  echo "Expected: $expected"
  echo "Got     : $normalized_output"
  exit 1
fi
