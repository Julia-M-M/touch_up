## DELETE NEW LINES FROM AN INPUT FILE AND SAVE IT IN AN OUTPUT NEW FILE ##

with open('input.txt', 'r') as input, open('output.txt', 'w') as output:
    # Read input.txt
    text = input.read()
    # Delete newline
    new_text = text.replace('\n', '>')
    # Write
    output.write(new_text)
