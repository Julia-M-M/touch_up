## This script overwrites the file ##

# Read input.txt
with open('input.txt', 'r') as file:
    text = file.read()

# Delete text and Write
with open('input.txt', 'w') as file:
    # Delete
    new_text = text.replace('\n', '>')
    # Write
    file.write(new_text)
