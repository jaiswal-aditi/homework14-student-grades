#!/bin/bash

echo "Running tests..."
echo

./person < test/input.txt > test/actual_output.txt

# Strip all whitespace and match only final output
filtered=$(grep -E "Name:|Age:|Country:" test/actual_output.txt | tr -d '[:space:]')
expected=$(tr -d '[:space:]' < test/expected_output.txt)

if [ $? -eq 0 ]; then
  echo "✅ Program exited successfully"
else
  echo "❌ Program did not exit cleanly"
  exit 1
fi

if [[ "$filtered" == "$expected" ]]; then
  echo "✅ Test passed"
else
  echo "❌ Test failed"
  echo "Expected: $expected"
  echo "Got     : $filtered"
  exit 1
fi
